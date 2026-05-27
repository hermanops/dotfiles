#!/usr/bin/env sh
set -eu

REPO_URL="${1:-https://github.com/REPLACE_ME/dotfiles.git}"

if ! command -v chezmoi >/dev/null 2>&1; then
  echo "chezmoi not found, installing..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
  export PATH="$HOME/.local/bin:$PATH"
fi

echo "Initializing chezmoi from: $REPO_URL"
chezmoi init --apply "$REPO_URL"

echo "Done. Run 'chezmoi status' to review managed state."
