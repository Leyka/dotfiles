# dotfiles
[Installation macOS](#mac) | [Installation Pi/Ubuntu](#pi) | [Last configurations](#config)

My personal dotfiles for macOS and Pi (used as web server)

To configure my dotfiles, I use [Stow](https://www.gnu.org/software/stow/manual/stow.html#Introduction).

# Installation

<a name="mac"></a>

## macOS

Install [iTerm2](https://iterm2.com/downloads.html)

```
git clone https://github.com/Leyka/dotfiles.git .dotfiles && cd .dotfiles
./osx.sh
```


<a name="pi"></a>

## Raspberry Pi / Ubuntu Server

Example with Raspberry Pi, but Ubuntu Server is similar except username is `ubuntu` (password `ubuntu` also)

Create new user and delete existing `pi` user

```
sudo adduser skan
sudo usermod -aG sudo skan
sudo su - skan
sudo pkill -u pi
```

SSH will disconnect... Then:

```
sudo deluser -remove-home pi
```

Clone dotfiles repo and run `pi.sh`

```
$ sudo apt update && sudo apt install -y git
$ git clone https://github.com/Leyka/dotfiles.git .dotfiles && cd .dotfiles
$ ./pi.sh
```

<a name="config"></a>

# Last configurations

## Git

Create `~/.gitconfig.local` file and add personal git infos

```ini
[user]
  name = your name
  email = your@email.com
```
