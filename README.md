![](https://github.com/jglovier/dotfiles-logo/blob/master/dotfiles-logo.png?raw=true)

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

## Stow

I use `stow` to automatically symlink my dotfiles

Make sure you are under `dotfiles` folder and run

```
$ stow fish git tmux vim
```

## Git

Add `.gitconfig.local` file with
```ini
[user]
  name = your name
  email = your@email.com
```