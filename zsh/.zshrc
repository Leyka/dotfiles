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

# Oh my zsh
source $ZSH/oh-my-zsh.sh

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Pyenv
eval "$(pyenv init --path)"

# Rbenv
eval "$(rbenv init -)"

# Nvm
source ~/.nvm/nvm.sh
source /opt/homebrew/opt/nvm/nvm.sh
