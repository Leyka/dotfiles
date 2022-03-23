###############################################################################
# General UI/UX
###############################################################################
# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input
###############################################################################
# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

###############################################################################
# Homebrew
###############################################################################
# Install homebrew and add it to path
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
# Install homebrew pckgs
brew update
brew upgrade
brew install coreutils
brew install bat
brew install git
brew install git-lfs
brew install httpie
brew install nmap
brew install nvm
brew install pure
brew install stow
brew install tig
brew install tree
brew install vim
brew install yarn
brew install z
# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-cascadia-code
brew install --cask font-cascadia-code-pl

###############################################################################
# ZSH
###############################################################################
# Install oh my zsh packages
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Remove "Last login ..." message on new shell
touch ~/.hushlogin

###############################################################################
# Symlink dotfiles
###############################################################################
# Symlink dotfiles using gnu stow
rm -f ~/.gitconfig ~/.vimrc ~/.zshrc
stow git vim zsh

###############################################################################
# Node.js 
###############################################################################
# Install LTS with nvm
mkdir ~/.nvm
echo "source ~/.nvm/nvm.sh\nsource $(brew --prefix nvm)/nvm.sh" > ~/.zprofile && source ~/.zprofile
nvm install --lts
nvm use --lts

# Configure git lfs
git lfs install

# Apply macOS changes
killall Dock &> /dev/null
killall Finder &> /dev/null