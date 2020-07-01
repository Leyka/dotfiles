#!/bin/bash

# Set Timezone
sudo timedatectl set-timezone America/Toronto

# Install pkgs 
sudo apt update -qq && sudo apt upgrade -yqq
sudo apt install -yqq curl fish htop make mosh stow tig tmux vim

# Default shell: fish
chsh -s `which fish`

# Symlink dotfiles
stow fish git tmux vim

sudo apt -yqq autoremove
sudo apt -yqq autoclean