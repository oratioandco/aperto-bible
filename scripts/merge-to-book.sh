#!/usr/bin/env bash
# merge-to-book.sh — Merge per-chapter USFM files into a single book file
# Usage: ./merge-to-book.sh <language> <book> [output_file]
# Example: ./merge-to-book.sh de 42-LUK

set -euo pipefail

LANGUAGE="${1:?Usage: merge-to-book.sh <language> <book> [output_file]}"
BOOK="${2:?Usage: merge-to-book.sh <language> <book> [output_file]}"
OUTPUT="${3:-}"

BOOK_DIR="texts/${LANGUAGE}/${BOOK}"

if [ ! -d "$BOOK_DIR" ]; then
  echo "Error: Directory $BOOK_DIR not found"
  exit 1
fi

# Determine output filename
if [ -z "$OUTPUT" ]; then
  # Extract book code from directory name (e.g., 42-LUK -> 42LUK)
  BOOK_CODE=$(echo "$BOOK" | tr -d '-')
  LANG_CODE=$(basename "$(find "$BOOK_DIR" -name "*.usfm" | head -1)" | sed 's/.*_ab-//' | sed 's/\.usfm//')
  OUTPUT="build/${LANGUAGE}_${BOOK_CODE}_ab-${LANG_CODE}.usfm"
fi

mkdir -p "$(dirname "$OUTPUT")"

# Sort files by chapter number
echo "Merging ${BOOK} (${LANGUAGE}) into ${OUTPUT}..."

# Get the first file for the header (everything before \c)
FIRST_FILE=$(ls "$BOOK_DIR"/*.usfm 2>/dev/null | sort | head -1)
if [ -z "$FIRST_FILE" ]; then
  echo "Error: No USFM files found in $BOOK_DIR"
  exit 1
fi

# Extract header (everything before the first \c marker)
sed '/^\\c /q' "$FIRST_FILE" | head -n -1 > "$OUTPUT"

# Process each chapter file in order
for file in $(ls "$BOOK_DIR"/*.usfm 2>/dev/null | sort); do
  basename "$(basename "$file")"
  # Skip header, start from first \c marker
  sed -n '/^\\c /,$p' "$file" >> "$OUTPUT"
  echo "" >> "$OUTPUT"
done

echo "Done! Merged book saved to: $OUTPUT"
echo "Total size: $(wc -c < "$OUTPUT" | tr -d ' ') bytes, $(grep -c '^\\\\v ' "$OUTPUT" || echo 0) verses"
