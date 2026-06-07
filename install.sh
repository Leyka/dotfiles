#!/usr/bin/env bash
set -euo pipefail

sudo -v

bash install/macOS
bash install/brew
bash install/zsh
bash install/mise
bash install/golang
bash install/nvim
bash install/git
bash install/ghostty

echo "✅ Done!"
