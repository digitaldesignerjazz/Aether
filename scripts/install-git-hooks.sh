#!/usr/bin/env bash
# Point this clone at the committed hooks in .githooks/
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "not a git work tree: $ROOT" >&2
  exit 1
fi

git config core.hooksPath .githooks
chmod +x .githooks/pre-commit .githooks/pre-push scripts/ci-field-hygiene.sh "$0"

echo "core.hooksPath=$(git config --get core.hooksPath)"
echo "pre-commit and pre-push now run scripts/ci-field-hygiene.sh"
