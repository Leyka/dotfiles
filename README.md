<img src="https://github.com/jglovier/dotfiles-logo/blob/master/dotfiles-logo.png" width="250">

My personal dotfiles for Arch Linux and Pi (used web as server)

To configure my dotfiles, I use the dead simple [Stow](https://www.gnu.org/software/stow/manual/stow.html#Introduction). It's *magic*.

# Installation 

## Arch Linux

(Todo)

## Raspberry Pi

Create new user and delete existing `pi` user
```
$ sudo adduser skan
$ sudo usermod -a -G adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input,netdev,gpio,i2c,spi skan
$ sudo su - skan
$ sudo pkill -u pi && sudo deluser -remove-home pi
```

Clone dotfiles repo and run `setup_pi.sh`
```
$ sudo apt update && sudo apt install -y git
$ git clone https://github.com/Leyka/dotfiles.git .dotfiles && cd .dotfiles
$ ./setup_pi.sh
```

# Configuration 

## Git

Add `.gitconfig.local` file with
```ini
[user]
  name = your name
  email = your@email.com
```
