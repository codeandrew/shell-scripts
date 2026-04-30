#!/bin/bash

# Update system
sudo yum update -y

####################################
## PACKAGES
####################################
# Define packages array
packages=(
  git
  coreutils
  gcc
  ncurses
  wget
  curl
  vim
  openssl
  unzip
  openssl-devel
  zsh
  tmux
  vim
  xclip
  fzf
  traceroute
  net-tools
  nmap
  python2-pip
  python3-pip
  ruby
  jq 
  langpacks-en
)

# Install packages
for package in "${packages[@]}"
do
  echo "---------------------------------"
  echo "Installing $package"
  echo
  sudo yum install -y $package
  echo
  echo "---------------------------------"
  echo
  echo
done 

sleep 2

####################################
## CONFIGS
####################################
echo "Copying Configs ..."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ../Configs/.zshrc $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp ../Configs/ubuntu_profile $HOME/.myprofile
cp ../Configs/ubuntu-tmux.conf $HOME/.tmux.conf
