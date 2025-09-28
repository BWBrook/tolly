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
if [ -f "$META" ]; then
  TITLE=$(grep -E '^title:' "$META" | sed 's/^title:[[:space:]]*"\{0,1\}//; s/"\{0,1\}$//') || true
fi

if [ -n "$TITLE" ]; then
  printf "# %s\n\n" "$TITLE" >> "$COMBINED_MD"
fi

# Append chapters ch00..ch19 (skip chNN and _index)
for f in $(ls "$CHAPTERS_DIR"/ch[0-9][0-9].md | grep -v '/chNN.md$' | sort); do
  base=$(basename "$f")
  [ "$base" = "_index.md" ] && continue
  # Extract chapter title from front matter
  ch_title=$(grep -E '^title:' "$f" | head -n1 | sed 's/^title:[[:space:]]*"\{0,1\}//; s/"\{0,1\}$//')
  [ -n "$ch_title" ] && printf "# %s\n\n" "$ch_title" >> "$COMBINED_MD"
  # Strip YAML front matter (first two --- blocks) and append body
  sed -e '1,/^---$/d' -e '1,/^---$/d' "$f" | sed '1{/^[[:space:]]*$/d}' >> "$COMBINED_MD"
  printf "\n\n" >> "$COMBINED_MD"
done

pandoc "$COMBINED_MD" -o "$OUT" --from=markdown --to=docx ${TITLE:+--metadata=title:"$TITLE"}

echo "Wrote: $OUT"
