#!/usr/bin/env sh
set -eu

# Bind chapters into a single .docx (chapter titles kept; YAML front matter stripped)
# Usage: scripts/bind_docx.sh [-o output.docx] [-m metadata.yml]

OUT="build/novella.docx"
META="book_metadata.yml"
CHAPTERS_DIR="chapters"

while [ "$#" -gt 0 ]; do
  case "$1" in
    -o|--out)
      OUT="$2"; shift 2;;
    -m|--meta)
      META="$2"; shift 2;;
    -h|--help)
      echo "Usage: $0 [-o output.docx] [-m metadata.yml]"; exit 0;;
    *) echo "Unknown arg: $1" >&2; exit 2;;
  esac
done

if ! command -v pandoc >/dev/null 2>&1; then
  echo "Error: pandoc not found. Install with 'brew install pandoc' (macOS) or 'sudo apt-get install pandoc' (Debian/Ubuntu)." >&2
  exit 2
fi

mkdir -p build
COMBINED_MD="build/combined.md"
rm -f "$COMBINED_MD"

# Optional title page from metadata
TITLE=""
BLURB=""
if [ -f "$META" ]; then
  TITLE=$(grep -E '^title:' "$META" | head -n1 | sed 's/^title:[[:space:]]*"\{0,1\}//; s/"\{0,1\}$//') || true
  # Capture YAML block scalar under 'blurb:' (lines starting with two spaces until next non-indented line)
  BLURB=$(awk '
    index($0,"blurb:")==1 { cap=1; next }
    cap==1 {
      if (substr($0,1,1) != " ") { exit }
      if (substr($0,1,2) == "  ") { print substr($0,3) } else { print }
    }
  ' "$META" 2>/dev/null || true)
fi

if [ -n "$TITLE" ]; then
  printf "# %s\n\n" "$TITLE" >> "$COMBINED_MD"
fi
if [ -n "$BLURB" ]; then
  printf "%s\n\n" "$BLURB" >> "$COMBINED_MD"
fi

# Append chapters ch00..ch19 (skip chNN and _index)
for f in $(ls "$CHAPTERS_DIR"/ch[0-9][0-9].md | sort); do
  base=$(basename "$f")
  [ "$base" = "_index.md" ] && continue
  # Extract chapter title from front matter
  ch_title=$(grep -E '^title:' "$f" | head -n1 | sed 's/^title:[[:space:]]*"\{0,1\}//; s/"\{0,1\}$//')
  # Prettify heading labels
  label=""
  case "$base" in
    ch00.md) label="Prologue: ";;
    ch19.md) label="Epilogue: ";;
    *)
      n=$(printf "%s" "$base" | sed 's/^ch\([0-9][0-9]\)\.md$/\1/')
      n=$(printf "%s" "$n" | sed 's/^0*//')
      [ -z "$n" ] && n=0
      label="Chapter ${n}: "
      ;;
  esac
  [ -n "$ch_title" ] && printf "# %s%s\n\n" "$label" "$ch_title" >> "$COMBINED_MD"

  # Strip YAML front matter robustly and append body
  awk '
    NR==1 { if ($0=="---") { skip=1; next } }
    skip==1 { if ($0=="---") { skip=0; next } else { next } }
    { print }
  ' "$f" | sed '1{/^[[:space:]]*$/d}' >> "$COMBINED_MD"
  printf "\n\n" >> "$COMBINED_MD"
done

pandoc "$COMBINED_MD" -o "$OUT" --from=markdown --to=docx ${TITLE:+--metadata=title:"$TITLE"}

echo "Wrote: $OUT"
