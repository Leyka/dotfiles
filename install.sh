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

# Make sure these files/folders doesn't already exist
files=(.gitconfig .vimrc .zshrc .zshenv)
rm -rf $HOME/"${files[@]}"
# Symlink dotfiles using gnu stow
stow git vim zsh
# Source .zshrc now so that nvm command below works
source $HOME/.zshrc

###############################################################################
# Create directories
###############################################################################

# GOPATH
mkdir -p $HOME/Lab/go
# nvm
mkdir -p $HOME/.nvm
# pyenv
mkdir -p $HOME/.pyenv

###############################################################################
# NVM / Node.js
###############################################################################

# Link nvm default-packages (includes yarn)
ln -s $PWD/nvm/default-packages $HOME/.nvm
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
