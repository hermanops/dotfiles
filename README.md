# dotfiles managed with chezmoi

This repository is a best-practice starter for managing personal dotfiles with
[chezmoi](https://www.chezmoi.io/).

## Why this layout

- Uses native chezmoi naming (`dot_`, `private_`, `.tmpl`) for clarity.
- Supports templating via `.chezmoidata.yaml` for machine/user-specific values.
- Keeps secrets in `private_` files so you can encrypt them with age, 1Password,
  or another secure backend.
- Includes repeatable bootstrap and local validation scripts.
- Includes a GitHub Actions workflow to catch template/apply issues early.

## Quick start

1. Install chezmoi:
   - Linux/macOS: `sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"`
2. Initialize from this repo:
   - `chezmoi init --apply <your-github-user>`
3. Edit managed files in source state:
   - `chezmoi edit ~/.bashrc`
4. Review and apply changes:
   - `chezmoi diff`
   - `chezmoi apply`

## Repository structure

- `.chezmoidata.yaml`: template data (name, email, machine flags).
- `.chezmoiignore.tmpl`: conditional ignore rules by OS/host.
- `dot_*` and `dot_config/*`: managed dotfiles.
- `private_*`: files that should contain sensitive content.
- `scripts/bootstrap.sh`: install and initialize chezmoi quickly.
- `scripts/check.sh`: local validation (doctor + dry-run apply).

## Recommended workflows

- Add or update files with chezmoi commands (not manual renames):
  - `chezmoi add ~/.gitconfig`
  - `chezmoi edit ~/.zshrc`
- Use templates for per-machine behavior:
  - `{{ if eq .chezmoi.os "linux" }}...{{ end }}`
- Keep secrets encrypted before committing:
  - `chezmoi add --encrypt ~/.ssh/id_ed25519`
- Validate before each push:
  - `./scripts/check.sh`

## Publishing to GitHub

1. Create an empty GitHub repo (for example `dotfiles`).
2. Add your remote:
   - `git remote add origin git@github.com:<user>/dotfiles.git`
3. Push:
   - `git push -u origin main`

## Notes

- Replace placeholder values in `.chezmoidata.yaml`.
- Update `scripts/bootstrap.sh` with your final repo URL if desired.
