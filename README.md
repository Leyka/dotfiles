# dotfiles

My personal dotfiles for Arch Linux distribution

## Installation

### Raspberry Pi

Create new user and delete existing `pi` user
```
$ sudo adduser skan
$ sudo usermod -a -G adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input,netdev,gpio,i2c,spi skan
$ sudo su - skan
$ sudo pkill -u pi && sudo deluser -remove-home pi
```

Clone dotfiles repo
```
$ sudo apt update && sudo apt install -y git
$ git clone https://github.com/Leyka/dotfiles.git && cd dotfiles
$ ./setup_pi.sh
```

# Git

Add `.gitconfig.local` file with
```ini
[user]
  name = your name
  email = your@email.com
```