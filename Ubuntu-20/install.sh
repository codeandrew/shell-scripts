#!/bin/bash

sudo apt update

## PACKAGES
packages=(
  git
  git-core
  build-essential
  openssl
  unzip
  libssl-dev
  zsh
  tmux
  vim
  xclip
  fzf
  traceroute
  net-tools
  netdiscover
  nmap
  zenmap
  python-pip
  python3-pip
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
  sudo apt -y install $package
  echo
  echo "---------------------------------"
  echo
  echo
done

sleep 2

## CONFIGS

echo "Copying Configs ..."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
cat ../Configs/ubuntu_profile $HOME/.myprofile
cp ../Configs/tmux.conf $HOME/.tmux.conf
echo
echo

sleep 2

echo "Generating Git Configs and SSH Keygen ..."

read -p "Git Config Email Address: " EMAIL
read -p "Git Config Full Name: " NAME

ssh-keygen -t rsa -b 4096 -C "${EMAIL}"
git config --global user.email "${EMAIL}"         
git config --global user.name "${NAME}"


sudo chsh -s $(which zsh)
source ~/.zshrc
echo "source $HOME/.myprofile" >> $HOME/.zshrc

## ALIASES
echo "Exporting Aliases"
echo "alias pbcopy='xclip -selection clipboard'" >> $HOME/.myprofile
echo "alias pwdc='pwd | xclip -selection clipboard'" >> $HOME/.myprofile
echo
echo


sudo update-alternatives --config editor
