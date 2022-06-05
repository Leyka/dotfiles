# dotfiles

`~/.`

## macOS

### Tools

- [Firefox](https://www.mozilla.org/en-CA/firefox/new/)
- [iTerm2](https://iterm2.com/downloads.html)

### Github

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

### iTerm2

Change iTerm2 theme by going to Preferences -> Appearance (👁) then select theme `Minimal`

Go to Profiles (👤) section -> click Other Actions on bottom left -> Scroll to `Import JSON Profiles`

Then import file under `settings/iTerm.json`

### Last steps

- Fill email in `./gitconfig.local`
