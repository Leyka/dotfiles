# dotfiles

My personal dotfiles for Arch Linux distribution.

## Installation

Make sure that [yay](https://github.com/Jguer/yay) is installed first. Yay is an AUR helper (Arch User Repository) that allows you to manage packages on Arch Linux

I use `make` command to do everything. Example of installation:

```
$ git clone https://github.com/Leyka/dotfiles.git
$ cd dotfiles
$ make install
$ make configure
```

## Laptop

For laptop use, I normally use **intel-undervolt** in order to reduce energy consumption and heat/noise problem, and **powertop** to minimize electric consumption.

- [intel-undervolt documentation](https://wiki.archlinux.org/index.php/Undervolting_CPU)
- [powertop documentation](https://wiki.archlinux.org/index.php/Powertop)

To install all packages + those 2 packages I would do

```
$ make install-laptop
```
