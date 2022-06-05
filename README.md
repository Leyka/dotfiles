# dotfiles

`~/.`

## macOS

### Tools

- [Firefox](https://www.mozilla.org/en-CA/firefox/new/)
- [iTerm2](https://iterm2.com/downloads.html)
- [Magnet](https://apps.apple.com/us/app/magnet/id441258766?mt=12)

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

- Show home folder on finder
  - Finder `->` Preferences `->` Sidebar then check folders

### iTerm2

Configure iTerm2 theme by going to `Preferences`, then under:

- General ⚙️
  - under `Closing` tab, uncheck all boxes
- Appearance 👁
  - select Theme: `Minimal`
- Profiles 👤
  - click Other Actions on bottom left
  - Scroll to `Import JSON Profiles`
  - Import JSON file under `settings/iTerm.json`

#### Preview

<img width="600" alt="image" src="https://user-images.githubusercontent.com/8690545/172064332-595fd827-469a-4823-b778-7571e50e4159.png">

### Last steps

- Fill email in `./gitconfig.local`
