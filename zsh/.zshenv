# Oh my zsh
export ZSH=$HOME/.oh-my-zsh

# Go
export GOPATH=$HOME/Lab/go
export PATH=$PATH:$(go env GOPATH)/bin

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"