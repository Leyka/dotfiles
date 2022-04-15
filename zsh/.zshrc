# Enable theme: Pure (https://github.com/sindresorhus/pure)
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -U promptinit; promptinit
prompt pure
ZSH_THEME=""

# ZSH Plugins
plugins=(
  colorize
  common-aliases
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  z
)

# import aliases
if [[ -e $HOME/.aliases ]]; then
  source $HOME/.aliases
fi

# import functions
if [[ -e $HOME/.functions ]]; then
  source $HOME/.functions
fi

# oh my zsh
if [[ -e $ZSH/oh-my-zsh.sh ]]; then
  source $ZSH/oh-my-zsh.sh
fi

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# pyenv
eval "$(pyenv init --path)"
export PATH="$PATH:$PYENV_ROOT/bin"

# golang
export PATH=$PATH:$(go env GOPATH)/bin

# nvm
if [[ -e $HOME/.nvm/nvm.sh ]]; then
  source $HOME/.nvm/nvm.sh
  source /opt/homebrew/opt/nvm/nvm.sh
fi

# thefuck
eval "$(thefuck --alias)"
