#!/usr/bin/env zsh

###############################################################################
# macOS settings
###############################################################################
source macOS.sh # comment to skip

###############################################################################
# Homebrew
###############################################################################
source brew.sh # comment to skip

###############################################################################
# Oh my ZSH
###############################################################################

# Install oh my zsh
[[ -d ~/.oh-my-zsh ]] || sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install oh my zsh packages
[[ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]] || git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
[[ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Remove "Last login ..." message on new shell
[[ -f ~/.hushlogin ]] || touch ~/.hushlogin

###############################################################################
# Create directories
###############################################################################

# GOPATH
mkdir -p ~/Lab/go
# nvm
mkdir -p ~/.nvm
# pyenv
mkdir -p ~/.pyenv

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
rm -rf ~/"${files[@]}"
# Symlink dotfiles using gnu stow
stow git vim nvim zsh
# Source .zshrc now so that nvm command below works
source ~/.zshrc

###############################################################################
# NVM / Node.js
###############################################################################

# Link nvm default-packages (includes yarn)
ln -sf $PWD/nvm/default-packages ~/.nvm
# Install LTS with nvm
nvm install --lts
nvm use --lts

###############################################################################
# Git
###############################################################################

# Configure git lfs
git lfs install

# Create .gitconfig.local
[[ -f ~/.gitconfig.local ]] || cat > ~/.gitconfig.local <<EOF
[user]
  name = Skander
  email = @gmail.com
EOF

###############################################################################
# Vim / Neovim
###############################################################################

# Install vim-plug
[[ -f ~/.config/nvim/autoload/plug.vim ]] || curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
