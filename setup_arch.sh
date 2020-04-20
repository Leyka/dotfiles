#!/bin/bash

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

install_from_file() {
  xargs -L 1 -a $1 yay -Sq --noconfirm --needed
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
sudo pacman -Sq yay --noconfirm --needed

# install packages
print "Installing packages"
install_from_file packages/shared.list
install_from_file packages/arch.list

if [[ $device = "Notebook" ]]; then
  # install laptop packages
  print "Installing laptop packages"
  install_from_file packages/arch_laptop.list
fi

print_success "Packages installed and updated"

# linking dotfiles
print "Symlink dotfiles using Stow"
stow -v fish git vim Code

# install vscode extensions
print "Installing VS Code extensions"
xargs -L 1 -a packages/vscode_extensions.list code --install-extension

# emojis
print "Configuring emojis"
mkdir -p ~/.config/fontconfig/conf.d
\cp -r fonts/01-emoji.conf ~/.config/fontconfig/conf.d

# startup
# fish
print "Setup fish as default shell"
chsh -s `which fish`
# guake
print "Enable Guake on startup"
sudo ln -s /usr/share/applications/guake.desktop /etc/xdg/autostart/
# docker
print "Enable Docker on startup"
sudo systemctl enable docker.service
sudo systemctl start docker.service

if [[ $device = "Notebook" ]]; then
  # spotify
  print "Fixing Spotify display with HiDPI screen"
  \cp -r spotify/spotify.desktop /usr/share/applications

  # powertop
  print "Enable powertop autotune on startup"
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

  # intel-undervolt (ask before)
  print "Undervolting Intel CPU for Matebook X Pro only !!!"
  read -p "Are you really really sure to continue ? (y/n)" ans
  if [[ $ans = "y" || $ans = "Y" ]]; then
    \cp -r intel-undervolt/intel-undervolt.conf /etc
    sudo intel-undervolt apply
    sudo systemctl enable intel-undervolt.service
    print_success "CPU undervolt applied"
  fi
fi

# cleanup
print "Cleanup"
yay -Sc --aur --noconfirm

print_success "Done"
