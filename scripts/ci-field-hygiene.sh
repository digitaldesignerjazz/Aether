#!/usr/bin/env bash
# Public field hygiene for Aether. No secrets, no private state, required docs present.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
fail=0

need() {
  if [[ ! -f "$1" ]]; then
    echo "MISSING: $1"
    fail=1
  else
    echo "OK      $1"
  fi
}

echo "== required surfaces =="
need README.md
need LICENSE
need CONTRIBUTING.md
need SECURITY.md
need CODE_OF_CONDUCT.md
need docs/VISION.md
need docs/ARCHITECTURE.md
need docs/PUBLIC_BOUNDARY.md
need docs/CI.md
need docs/GLOSSARY.md

echo
echo "== forbidden path names =="
if find . -path ./.git -prune -o \(
    -iname '*skilllogin*' -o -iname '*_state.md' -o -iname '*.pem' -o -iname '*.key' -o -iname '.env' -o -iname '.env.*' \) -print | grep -v './.env.example' | grep -q .
then
  echo "FORBIDDEN path present"
  find . -path ./.git -prune -o \(
      -iname '*skilllogin*' -o -iname '*_state.md' -o -iname '*.pem' -o -iname '*.key' -o -iname '.env' -o -iname '.env.*' \) -print
  fail=1
else
  echo "OK      no private-looking filenames"
fi

echo
echo "== secret-shaped content =="
# Intentional dummy-safe scan. Dummy examples in docs may use 0x00 / example.invalid.
matches=$(grep -RInE --exclude-dir=.git --exclude-dir=.github \
  --exclude='*.yml' --exclude='ci-field-hygiene.sh' \
  'BEGIN (RSA |OPENSSH |EC )?PRIVATE KEY|AWS_SECRET_ACCESS_KEY|NETBIRD_SETUP_KEY|xprv|mnemonic:[[:space:]]*[a-z]+( [a-z]+){11}' . || true)

if [[ -n "$matches" ]]; then
  echo "FORBIDDEN content:"
  echo "$matches"
  fail=1
else
  echo "OK      no private-key or seed patterns"
fi

echo
if [[ "$fail" -ne 0 ]]; then
  echo "FIELD HYGIENE FAILED"
  exit 1
fi
echo "FIELD HYGIENE PASSED"
