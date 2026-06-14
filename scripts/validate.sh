#!/usr/bin/env bash
# validate.sh — Basic USFM syntax validation
# Usage: ./validate.sh [file_or_directory]
# If directory, validates all .usfm files recursively.

set -euo pipefail

TARGET="${1:-texts}"
ERRORS=0
WARNINGS=0
FILES=0

validate_file() {
  local file="$1"
  local filename=$(basename "$file")
  
  FILES=$((FILES + 1))
  
  # Check required headers
  if ! grep -q '^\\id ' "$file"; then
    echo "  ❌ $filename: Missing \\id marker"
    ERRORS=$((ERRORS + 1))
    return
  fi
  
  if ! grep -q '^\\usfm ' "$file"; then
    echo "  ⚠️  $filename: Missing \\usfm version marker"
    WARNINGS=$((WARNINGS + 1))
  fi
  
  if ! grep -q '^\\ide ' "$file"; then
    echo "  ⚠️  $filename: Missing \\ide encoding marker"
    WARNINGS=$((WARNINGS + 1))
  fi
  
  # Check for chapters
  CHAPTERS=$(grep -c '^\\c ' "$file" || echo "0")
  if [ "$CHAPTERS" -eq 0 ]; then
    echo "  ❌ $filename: No chapter markers found"
    ERRORS=$((ERRORS + 1))
    return
  fi
  
  # Check for verses
  VERSES=$(grep -c '^\\v ' "$file" || echo "0")
  if [ "$VERSES" -eq 0 ]; then
    echo "  ❌ $filename: No verse markers found"
    ERRORS=$((ERRORS + 1))
    return
  fi
  
  # Check footnote balance
set +o pipefail
  F_OPEN=$(grep -o '\\f +' "$file" | wc -l | tr -d ' ')
  F_CLOSE=$(grep -o '\\f\*' "$file" | wc -l | tr -d ' ')
  if [ "$F_OPEN" -ne "$F_CLOSE" ]; then
    echo "  ⚠️  $filename: Footnote mismatch (opened: $F_OPEN, closed: $F_CLOSE)"
    WARNINGS=$((WARNINGS + 1))
  fi
  
  # Check \add balance
  ADD_OPEN=$({ grep -o '\\add ' "$file" || true; } | wc -l | tr -d ' ')
  ADD_CLOSE=$({ grep -o '\\add\*' "$file" || true; } | wc -l | tr -d ' ')
  if [ "$ADD_OPEN" -ne "$ADD_CLOSE" ]; then
    echo "  ⚠️  $filename: \\add marker mismatch (opened: $ADD_OPEN, closed: $ADD_CLOSE)"
    WARNINGS=$((WARNINGS + 1))
  fi
  
  echo "  ✅ $filename: ${CHAPTERS} chapter(s), ${VERSES} verses, ${F_OPEN} footnote(s)"
}

echo "🔍 Validating USFM files in: $TARGET"
echo ""

if [ -f "$TARGET" ]; then
  validate_file "$TARGET"
elif [ -d "$TARGET" ]; then
  find "$TARGET" -name "*.usfm" -type f | sort | while read -r file; do
    validate_file "$file"
  done
else
  echo "Error: $TARGET not found"
  exit 1
fi

echo ""
echo "📊 Results: $FILES file(s) checked, $ERRORS error(s), $WARNINGS warning(s)"

if [ "$ERRORS" -gt 0 ]; then
  exit 1
fi
