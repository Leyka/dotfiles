#!/usr/bin/env bash

# Install homebrew
command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update
brew upgrade

# Install brew packages
packages=(
  coreutils
  bat
  git
  git-lfs
  httpie
  jq
  golang
  nmap
  nvm
  neovim
  pure
  pyenv
  stow
  tig
  thefuck
  tree
  vim
  z
)

brew install "${packages[@]}"

# Install fonts
fonts=(
  font-fira-code
  font-cascadia-code
  font-cascadia-code-pl
)

brew tap homebrew/cask-fonts
brew install --cask "${fonts[@]}"

# Cleanup
brew cleanup
