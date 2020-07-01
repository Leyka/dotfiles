# dotfiles
[Installation Arch](#arch) | [Installation Pi/Ubuntu](#pi) | [Last configurations](#config)

My personal dotfiles for Arch Linux and Pi (used web as server)

To configure my dotfiles, I use the dead simple [Stow](https://www.gnu.org/software/stow/manual/stow.html#Introduction). It's _magic_.

# Installation

<a name="arch"></a>

## Arch Linux

```
$ git clone https://github.com/Leyka/dotfiles.git .dotfiles && cd .dotfiles
$ ./setup_arch.sh
```

### Tweaks

- General
  - Check Over-Amplification
- Appearance
  - Applications: Arc-Darker
  - Cursor: Xcursor-breezer
  - Icons: Qogir
  - Shell: Arc

### Laptop

For laptop use, I normally use **intel-undervolt** in order to reduce energy consumption and heat/noise problem, and **powertop** to minimize electric consumption.

**alsa-tools** is used to fix [issue](https://www.reddit.com/r/MatebookXPro/comments/8z4pv7/fix_for_the_2_out_of_4_speakers_issue_on_linux/) with surround sound on laptop.

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

Clone dotfiles repo and run `setup_pi.sh`

```
$ sudo apt update && sudo apt install -y git
$ git clone https://github.com/Leyka/dotfiles.git .dotfiles && cd .dotfiles
$ ./setup_pi.sh
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
