export EDITOR=nvim
export VISUAL=nvim

# bin
export DOTFILES=~/.dotfiles
export PATH="$DOTFILES/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# brew
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# Pyenv
export PYENV_ROOT=~/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"

# Go
export GOROOT=/opt/homebrew/opt/go/libexec
export GOPATH=~/Lab/go
export PATH="$GOPATH/bin:$PATH"

# nvm
export NVM_DIR=~/.nvm

# Shell
export LS_COLORS="$($HOMEBREW_PREFIX/bin/vivid generate snazzy)"
