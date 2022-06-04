# dotfiles



## macOS

### Tools

* [Firefox](https://www.mozilla.org/en-CA/firefox/new/)
* [iTerm2](https://iterm2.com/downloads.html)
* [VS Code](https://code.visualstudio.com/)

### Git

Generate SSH key

```
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub | pbcopy
```

Paste SSH key in Github settings

### Install

Install Xcode command line tools

```
xcode-select --install
```

Clone this repo under `~/.dotfiles` and run install script

```
git clone git@github.com:Leyka/dotfiles.git .dotfiles && cd .dotfiles
```

Run install script

```
./install.sh
```

### Finder

Show home folder on finder by going to Finder -> Preferences -> Sidebar then check folders

Show hidden folders: `cmd`+`shift`+`o`

### iTerm2 theme

Change iTerm2 theme by going to Preferences -> Profiles

Click on Colors tab -> Color Presets... (bottom right) -> Import -> `~/.dotfiles/themes/Snazzy.itermcolors` then select `Snazzy`

Change font by going on Text tab -> Font -> select `Hack Nerd Font Mono` and size `15`

Hide the ugly top bar by going to Appearance section (eye) -> General tab -> select theme `Minimal`

### Last steps

* Fill email in `./gitconfig.local`
