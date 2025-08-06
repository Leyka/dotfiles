#!/usr/bin/env zsh
set -e

sudo -v

source install/macOS
source install/brew
source install/zsh
source install/nvm
source install/pyenv
source install/golang
source install/nvim
source install/git
source install/ghostty

echo "✅ Done!"
