#!/usr/bin/env bash

# Install homebrew if not already installed
if [[ ! -x "$(command -v brew)" ]]; then
  xcode-select --install
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install brew packages
packages=(
  coreutils
  ctags
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

brew update
brew upgrade
brew install "${packages[@]}"

# Install fonts
fonts=(
  font-fira-code
  font-cascadia-code
  font-cascadia-code-pl
  font-hack-nerd-font
)

brew tap homebrew/cask-fonts
brew install --cask "${fonts[@]}"

# Cleanup
brew cleanup
