#!/bin/bash

# Fix timezone
sudo timedatectl set-timezone America/Toronto

# Update system
sudo apt update -qq && sudo apt upgrade -yqq

# Install: basic packages
packages=(
  curl
  fail2ban
  htop
  iftop
  make
  mosh
  stow
  tmux
  tree
  ufw
  vim
)
sudo apt-get install -yqq "${packages[@]}"

# Symlink dotfiles
stow git tmux vim

# Configure firewall for HTTP/HTTPS
sudo ufw enable
sudo ufw allow from 192.168.1.0/24
sudo ufw allow 80
sudo ufw allow 443

# configure Fail2ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo service fail2ban restart

sudo apt -yqq autoremove
sudo apt -yqq autoclean
