#!/bin/bash

# Set Timezone
sudo timedatectl set-timezone America/Toronto

# Install pkgs 
sudo apt update -qq && sudo apt upgrade -yqq
sudo apt install -yqq curl fish htop make mosh stow tig tmux ufw vim 

# Default shell: fish
chsh -s `which fish`

# Symlink dotfiles
stow fish git tmux vim

# Firewall
sudo ufw enable
sudo ufw allow from 192.168.1.0/24

sudo apt -yqq autoremove
sudo apt -yqq autoclean