#!/usr/bin/env bash
# Package a skill directory into a distributable zip.
# Usage: scripts/package-skill.sh <skill-name> [version]
# Output: dist/<skill-name>[-version].zip

set -euo pipefail

SKILL="${1:?Usage: $0 <skill-name> [version]}"
VERSION="${2:-}"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILL_DIR="$REPO_ROOT/$SKILL"

if [ ! -d "$SKILL_DIR" ]; then
  echo "Error: skill directory not found: $SKILL_DIR" >&2
  exit 1
fi

if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
  echo "Error: $SKILL_DIR/SKILL.md not found — not a valid skill" >&2
  exit 1
fi

mkdir -p "$REPO_ROOT/dist"

if [ -n "$VERSION" ]; then
  OUT="$REPO_ROOT/dist/${SKILL}-${VERSION}.zip"
else
  OUT="$REPO_ROOT/dist/${SKILL}.zip"
fi

cd "$REPO_ROOT"
zip -r "$OUT" "$SKILL/" -x '*.DS_Store' '*/.git/*' '*.swp'
echo "Created $OUT"
