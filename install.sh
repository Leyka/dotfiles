#!/usr/bin/env bash

###############################################################################
# macOS settings
###############################################################################
. scripts/macOS.sh

###############################################################################
# Homebrew
###############################################################################
. scripts/brew.sh

###############################################################################
# Oh my ZSH
###############################################################################

# Install oh my zsh
[ -d $HOME/.oh-my-zsh ] || sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install oh my zsh packages
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Remove "Last login ..." message on new shell
touch $HOME/.hushlogin


###############################################################################
# Symlink dotfiles
###############################################################################

# Make sure files/folders doesn't already exist
remove=(
  .gitconfig
  .vimrc
  .zshrc
  .zshenv
  .nvm
)
# Symlink dotfiles using gnu stow
rm -rf $HOME/"${remove[@]}"
stow git vim zsh
# Source .zshrc now so that nvm command below works
source $HOME/.zshrc

###############################################################################
# Create directories
###############################################################################

# GOPATH
mkdir -p $HOME/Lab/go
# pyenv
mkdir -p $HOME/.pyenv

###############################################################################
# Node.js
###############################################################################

# Install LTS with nvm
nvm install --lts
nvm use --lts

###############################################################################
# Git
###############################################################################

# Configure git lfs
git lfs install

###############################################################################
# Last steps
###############################################################################

# Apply macOS changes
killall Dock &> /dev/null
killall Finder &> /dev/null
