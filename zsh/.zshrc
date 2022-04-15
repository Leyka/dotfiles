# ZSH Plugins
plugins=(
  colorize
  common-aliases
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  z
)

# Enable theme: Pure (https://github.com/sindresorhus/pure)
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -U promptinit; promptinit
prompt pure
ZSH_THEME=""

# Aliases
if [[ -e $HOME/.zsh_aliases ]]; then
  source $HOME/.zsh_aliases
fi

# Functions
if [[ -e $HOME/.zsh_functions ]]; then
  source $HOME/.zsh_functions
fi

# Oh my zsh
source $ZSH/oh-my-zsh.sh

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Pyenv
eval "$(pyenv init --path)"
export PATH="$PATH:$PYENV_ROOT/bin"

# Golang
export PATH=$PATH:$(go env GOPATH)/bin

# nvm
if [[ -e $HOME/.nvm/nvm.sh ]]; then
  source $HOME/.nvm/nvm.sh
  source /opt/homebrew/opt/nvm/nvm.sh
fi

# thefuck
eval "$(thefuck --alias)"
