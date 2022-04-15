#!/usr/bin/env bash

###############################################################################
# macOS settings
###############################################################################
source .macOS # comment to skip

###############################################################################
# Homebrew
###############################################################################
source .brew # comment to skip

###############################################################################
# Oh my ZSH
###############################################################################

# Install oh my zsh
[[ -d $HOME/.oh-my-zsh ]] || sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install oh my zsh packages
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Remove "Last login ..." message on new shell
touch $HOME/.hushlogin

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
# Symlink dotfiles
###############################################################################

# Make sure these files/folders doesn't already exist
files=(
  .config/nvim
  .gitconfig
  .gitignore
  .vimrc
  .zshrc
  .zshenv
)
rm -rf $HOME/"${files[@]}"
# Symlink dotfiles using gnu stow
stow git vim nvim zsh
# Source .zshrc now so that nvm command below works
source $HOME/.zshrc

###############################################################################
# NVM / Node.js
###############################################################################

# Link nvm default-packages (includes yarn)
ln -sf $PWD/nvm/default-packages $HOME/.nvm
# Install LTS with nvm
nvm install --lts
nvm use --lts

###############################################################################
# Git
###############################################################################

# Configure git lfs
git lfs install

# Create .gitconfig.local
[[ -e $HOME/.gitconfig.local ]] || cat > $HOME/.gitconfig.local <<EOF
[user]
  name = Skander
  email = @gmail.com
EOF

###############################################################################
# Last steps
###############################################################################

# Apply macOS changes
killall Dock &> /dev/null
killall Finder &> /dev/null
