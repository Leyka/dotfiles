#!/bin/bash

#==========
#  Helpers
#==========
yellow="\e[93m"
green="\e[92m"
red=""
reset="\033[0m"

print() {
  echo -e "$yellow==> $1$reset"
}
print_success() {
  echo -e "$green==> $1$reset"
}
print_error() {
  echo -e "$red==> $1$reset"
}
command_exists () {
    type "$1" &> /dev/null ;
}
check_command() {
  if command_exists $1 ; then
    print_success "$1 installed"
  else
    print_error "$1 failed. Check installation or path."
  fi
}

#==========
#  Main
#==========
print "Preparing your Raspberry Pi"

# system update
print "Updating sytem ..."
sudo apt update -qq && sudo apt upgrade -yqq

# install packages
print "Installing Pi packages ..."
xargs -L 1 -a packages/pi sudo apt install -yqq

# installing node and yarn
print "Installing Node.js ..."
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
sudo apt -yqq install nodejs
check_command "node"
check_command "npm"

print "Installing Yarn ..."
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
check_command "yarn"

# installing docker and docker-compose
print "Installing Docker ..."
curl -sSL https://get.docker.com | bash
sudo usermod -aG docker $username
check_command "docker"

print "Installing Docker-compose ... (might take a while)"
sudo apt install -yqq python3-pip libffi-dev
sudo pip3 install docker-compose
check_command "docker-compose"

# configuring startup apps 
print "Configuring startup apps ..."
chsh -s `which fish`

# configure firewall (web server + ssh)
print "Configuring firewall ports: ssh + http/s + mosh ..."
sudo ufw enable
sudo ufw allow from 192.168.1.0/24 to any port 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow from 192.168.1.0/24 to any port 60000:61000/udp # mosh

# clean up
print "Cleaning up ..."
sudo apt -yq autoremove && sudo apt -yq autoclean

print_success "Done"

# next steps: 
# - remove pi user 
# - only authorize my user to connect on ssh 
# - configure fail2ban (3 attempts)