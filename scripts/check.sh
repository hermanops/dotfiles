#!/usr/bin/env sh
set -eu

if ! command -v chezmoi >/dev/null 2>&1; then
  echo "chezmoi is required. Install it first." >&2
  exit 1
fi

echo "==> chezmoi doctor"
chezmoi doctor

echo "==> chezmoi apply --dry-run --verbose"
chezmoi apply --dry-run --verbose

echo "Checks passed."
