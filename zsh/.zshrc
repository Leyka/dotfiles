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
PURE_CMD_MAX_EXEC_TIME=0 # Always show exec. time after 1s
ZSH_THEME=""

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
[[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ]] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ]] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# import aliases at the very end
[[ -f $HOME/.aliases ]] && source $HOME/.aliases
