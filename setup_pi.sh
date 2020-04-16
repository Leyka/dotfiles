#!/bin/bash

#==========
#  Helpers
#==========
print() {
  echo "==> $1"
}

green="\e[92m"
reset="\033[0m"
print_success() {
  echo -e "$green==> $1$reset"
}

ask() {
  read -p "==> $1 (y/n): " answer
}

#==========
#  Main
#==========
echo "Preparing Raspberry Pi ..."

# create user
ask "Creating new user ?"
if [[ $answer == "y" || $answer == "Y" ]]; then
  read -p "Username: " username
  sudo adduser $username
  sudo usermod -a -G adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input,netdev,gpio,i2c,spi ${username}
  sudo su - $username
fi

sudo echo "hi"
whoami
