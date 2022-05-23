# ZSH Plugins
plugins=(
  colorize
  common-aliases
  zsh-syntax-highlighting
  zsh-autosuggestions
  z
)

# Enable theme: Pure (https://github.com/sindresorhus/pure)
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -U promptinit; promptinit
prompt pure
ZSH_THEME=""

# import aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases
# import functions
[[ -f $HOME/.functions ]] && source $HOME/.functions
# oh my zsh
[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh
# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
# thefuck
eval "$(thefuck --alias)"
# pyenv
eval "$(pyenv init --path)"
# golang
[[ -x "$(command -v go)" ]] && export PATH=$PATH:$(go env GOPATH)/bin
# nvm
if [[ -f $HOME/.nvm/nvm.sh ]]; then
  source $HOME/.nvm/nvm.sh
  source /opt/homebrew/opt/nvm/nvm.sh
fi
