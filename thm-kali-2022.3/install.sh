#!/bin/bash

packages=(
  beef-xss
  build-essential
  openssl
  unzip
  libssl-dev
  tmux
  xclip
  fzf
  netdiscover
  ruby
  jq 
  yq  
  neofetch
)

for package in "${packages[@]}"
do
  echo "---------------------------------"
  echo "Installing $package"
  echo
  sudo apt-get -y install $package
  echo
  echo "---------------------------------"
  echo
  echo
done


cat ../Configs/ubuntu_profile >> $HOME/.myprofile
cp ../Configs/tmux.conf $HOME/.tmux.conf
echo
echo

echo "source $HOME/.myprofile" >> $HOME/.zshrc
