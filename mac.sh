#!/usr/bin/env bash

###############################################################################
# General UI/UX
###############################################################################

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

###############################################################################
# Finder
###############################################################################

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

###############################################################################
# Dock, Dashboard, and hot corners
###############################################################################

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true
# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 38
# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

###############################################################################
# iTerm2
###############################################################################

# Don’t display prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

###############################################################################
# Homebrew
###############################################################################

# Install homebrew and add it to path
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
# Install homebrew packages
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
  yarn
  z
)

brew update
brew upgrade
brew install "${packages[@]}"
# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-cascadia-code
brew install --cask font-cascadia-code-pl
brew cleanup

###############################################################################
# ZSH
###############################################################################
# Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install oh my zsh packages
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Remove "Last login ..." message on new shell
touch $HOME/.hushlogin

###############################################################################
# Symlink dotfiles
###############################################################################

# Symlink dotfiles using gnu stow
rm -f $HOME/.gitconfig $HOME/.vimrc $HOME/.zshrc $HOME/.zshenv
stow git vim zsh
# Source .zshrc now so that nvm command below works
source $HOME/.zshrc

###############################################################################
# Create directories
###############################################################################

# GOPATH
mkdir -p $HOME/Lab/go
# nvm
mkdir $HOME/.nvm
# pyenv
mkdir $HOME/.pyenv

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
