#!/bin/bash
set -e

#==========
#  Helpers
#==========
yellow="\e[93m"
green="\e[92m"
reset="\033[0m"

print() {
  echo -e "$yellow==> $1$reset"
}

print_success() {
  echo -e "$green==> $1$reset"
}

command_exists () {
    type "$1" &> /dev/null ;
}

#==========
#  Main
#==========
device="$(sudo dmidecode --string chassis-type)"
print "Preparing your Arch Linux based distribution"

# update
print "Updating system"
sudo pacman -Syu --noconfirm

# install yay
print "Installing Yay"
sudo pacman -S yay --noconfirm

# install packages 
print "Installing packages"
xargs -L 1 -a packages/shared.list yay --noconfirm --needed -S
xargs -L 1 -a packages/arch.list yay --noconfirm --needed -S

if [[ $device = "Laptop" ]]; then
  # install laptop packages
  print "Installing laptop packages"
  xargs -L 1 -a packages/arch_laptop.list yay --noconfirm --needed -S
fi

print_success "Packages installed and updated"

print "Starting Configuration"

# linking dotfiles
print "Symlink dotfiles using Stow"
stow -v fish git vim Code

# install vscode extensions
print "Installing VS Code extensions"
xargs -L 1 -a packages/vscode_extensions.list code --install-extension

# startup apps
# fish
print "Set fish as default shell"
sudo chsh -s `which fish`
# guake
print "Enable guake on startup"
ln -s /usr/share/applications/guake.desktop /etc/xdg/autostart/
# docker
print "Enable docker on startup"
sudo systemctl enable docker.service 
sudo systemctl start docker.service

# todo: guake

if [[ $device = "Laptop" ]]; then
  # todo: intel-undervolt (ask before)
  
  # powertop 
  print "Enable powertop autotune on startup"
  sudo powertop --auto-tune
  sudo cat << EOF | sudo tee /etc/systemd/system/powertop.service
[Unit]
Description=Powertop tunings

[Service]
Type=exec
ExecStart=/usr/bin/powertop --auto-tune
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOF
  sudo systemctl daemon-reload && sudo systemctl enable powertop.service
fi

# cleanup 
print "Cleanup"
sudo yay -Sc --aur --noconfirm

print_success "Done"