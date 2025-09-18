#!/usr/bin/env sh
set -eu

# Simple style guard for this repo. POSIX sh only.
# Usage: checks/run_style_checks.sh [chapters_dir]

CHAPTERS_DIR=${1:-chapters}
RG=${RG:-rg}

if ! command -v "$RG" >/dev/null 2>&1; then
  echo "Error: ripgrep (rg) is required." >&2
  exit 2
fi

if [ ! -d "$CHAPTERS_DIR" ]; then
  echo "Error: chapters dir not found: $CHAPTERS_DIR" >&2
  exit 2
fi

errors=0

echo "== Checking banned modern lexis (SL-BAN-003) =="
hits=$($RG -n -w --ignore-case -f style/LEXICON/banned_modern.txt "$CHAPTERS_DIR"/ch*.md 2>/dev/null || true)
if [ -n "$hits" ]; then
  echo "BANNED LEXIS FOUND:" >&2
  echo "$hits" >&2
  errors=$((errors+1))
else
  echo "OK: no banned modern terms."
fi

echo "\n== Checking banned units/symbols (SL-UNI-004) =="
unit_pat='\b(km|kilometer|kilometre|meters|metres|%|degree[SC])\b'
hits=$($RG -n -e "$unit_pat" "$CHAPTERS_DIR"/ch*.md 2>/dev/null || true)
if [ -n "$hits" ]; then
  echo "BANNED UNITS/SYMBOLS FOUND:" >&2
  echo "$hits" >&2
  errors=$((errors+1))
else
  echo "OK: no metric units or % symbols."
fi

echo "\n== Checking allowed time anchors present (SL-UNI-004) =="
# Try to read from config.yml; fall back to canonical list.
cfg_line=$(grep -E "time_phrasing_allowed:" config.yml 2>/dev/null || true)
if [ -n "$cfg_line" ]; then
  pattern=$(printf '%s\n' "$cfg_line" | sed 's/.*\[\(.*\)\].*/\1/' | sed 's/",[ ]*"/|/g; s/"//g')
else
  pattern='after harvest|first frost|spring sowing|by sundown|at first light|by bells'
fi
for f in "$CHAPTERS_DIR"/ch*.md; do
  [ -e "$f" ] || continue
  if $RG -n -i -e "$pattern" "$f" >/dev/null 2>&1; then
    echo "OK: time anchor present — $(basename "$f")"
  else
    echo "MISSING allowed time phrase — $f" >&2
    errors=$((errors+1))
  fi
done

echo "\n== Checking British spelling (MUST) =="
mapfile=${MAPFILE_PATH:-style/LEXICON/american_to_british.tsv}
if [ -f "$mapfile" ]; then
  us_words=$(awk -F '\t' 'NF==2{print $1}' "$mapfile")
  hits=""
  for w in $us_words; do
    m=$($RG -n -w -i "$w" "$CHAPTERS_DIR"/ch*.md 2>/dev/null || true)
    [ -n "$m" ] && hits="$hits\n$m"
  done
  if [ -n "$hits" ]; then
    echo "US spellings found; prefer British forms (see american_to_british.tsv):" >&2
    printf "%b\n" "$hits" | sed '/^$/d' >&2
    errors=$((errors+1))
  else
    echo "OK: British spellings in use (no US variants detected)."
  fi
else
  echo "Note: mapping file not found: $mapfile (skipping)."
fi

echo "\n== Checking em-dash usage (SHOULD: ≤ 3 per chapter) =="
emdash_limit=${EMDASH_MAX:-3}
for f in "$CHAPTERS_DIR"/ch*.md; do
  [ -e "$f" ] || continue
  count=$($RG -o "—" "$f" | wc -l | awk '{print $1}')
  if [ "$count" -le "$emdash_limit" ]; then
    echo "OK: em-dashes $count ≤ $emdash_limit — $(basename "$f")"
  else
    echo "EM-DASH overuse ($count) — $f" >&2
    errors=$((errors+1))
  fi
done

echo "\n== Checking place anchors in front matter (SL-PLC-201 heuristic) =="
for f in "$CHAPTERS_DIR"/ch*.md; do
  [ -e "$f" ] || continue
  if grep -Eq '^place_anchors:\s*\[[^]]*,[^]]*\]' "$f"; then
    echo "OK: ≥2 place anchors — $(basename "$f")"
  else
    echo "PLACE ANCHORS missing or <2 — $f" >&2
    errors=$((errors+1))
  fi
done

echo "\n== Checking song quota (SL-SNG-301) =="
for f in "$CHAPTERS_DIR"/ch*.md; do
  [ -e "$f" ] || continue
  count=$(grep -n '^song_present:\s*true' "$f" | wc -l | awk '{print $1}')
  if [ "$count" -le 1 ]; then
    echo "OK: song quota ≤1 — $(basename "$f")"
  else
    echo "TOO MANY songs flagged — $f" >&2
    errors=$((errors+1))
  fi
done

echo "\n== Checking new_proper_nouns glossed (SL-NAM-501) =="
gloss_file=background/glossary.md
for f in "$CHAPTERS_DIR"/ch*.md; do
  [ -e "$f" ] || continue
  line=$(grep -E '^new_proper_nouns:' "$f" || true)
  if [ -z "$line" ]; then
    echo "OK: no new names — $(basename "$f")"
    continue
  fi
  names=$(printf '%s\n' "$line" | sed 's/.*\[\(.*\)\].*/\1/' | tr ',' '\n' | sed 's/^[[:space:]]*"//; s/"[[:space:]]*$//; s/^[[:space:]]*//; s/[[:space:]]*$//')
  missing=0
  for n in $names; do
    [ -z "$n" ] && continue
    if ! grep -F -q "$n" "$gloss_file" 2>/dev/null; then
      echo "MISSING GLOSS — $n (from $(basename "$f"))" >&2
      missing=1
    fi
  done
  if [ "$missing" -eq 0 ]; then
    echo "OK: all new names glossed — $(basename "$f")"
  else
    errors=$((errors+1))
  fi
done

echo "\n== Checking triad tracking coverage (SHOULD) =="
triad_file=planning/triad_tracking.md
missing_cover=0
if [ -f "$triad_file" ]; then
  for f in "$CHAPTERS_DIR"/ch*.md; do
    [ -e "$f" ] || continue
    base=$(basename "$f" .md)
    if ! grep -q "$base" "$triad_file"; then
      echo "TRIAD LOG missing entry for $base — add to planning/triad_tracking.md" >&2
      missing_cover=1
    fi
  done
  if [ "$missing_cover" -eq 0 ]; then
    echo "OK: triad tracking covers all present chapters."
  else
    errors=$((errors+1))
  fi
else
  echo "Triad tracking file not found (planning/triad_tracking.md)." >&2
  errors=$((errors+1))
fi

echo "\n== Checking italics usage (SHOULD: ≤ 4 per chapter) =="
italic_limit=${ITALIC_MAX:-4}
for f in "$CHAPTERS_DIR"/ch*.md; do
  [ -e "$f" ] || continue
  count=$($RG -o '\*[^*\n]{1,60}\*' "$f" | wc -l | awk '{print $1}')
  if [ "$count" -le "$italic_limit" ]; then
    echo "OK: italics $count ≤ $italic_limit — $(basename "$f")"
  else
    echo "ITALICS overuse ($count) — $f" >&2
    errors=$((errors+1))
  fi
done

echo "\n== Result =="
if [ "$errors" -eq 0 ]; then
  echo "All checks passed."
  exit 0
else
  echo "$errors check(s) failed." >&2
  exit 1
fi
