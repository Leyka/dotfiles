#!/usr/bin/env bash

# Link dotfiles
rm -rf ~/.zshrc ~/.zshenv

stow zsh

# Apply changes
source ~/.zshrc
