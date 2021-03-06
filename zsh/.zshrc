export ZSH=$HOME/.oh-my-zsh

# Enable theme: Pure (https://github.com/sindresorhus/pure)
autoload -U promptinit; promptinit
prompt pure
ZSH_THEME=""

plugins=(colorize common-aliases git zsh-syntax-highlighting zsh-autosuggestions z)

source $ZSH/oh-my-zsh.sh
