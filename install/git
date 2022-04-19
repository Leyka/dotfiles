#!/usr/bin/env bash

# Link dotfiles
rm -rf ~/.gitconfig ~/.gitignore.global
stow git

# Configure git lfs
git lfs install

# Create .gitconfig.local if doesn't exist
[[ -f ~/.gitconfig.local ]] || cat > ~/.gitconfig.local <<EOF
[user]
  name = Skander
  email = @gmail.com
EOF
