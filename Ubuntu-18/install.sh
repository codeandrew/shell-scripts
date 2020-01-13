#!/bin/bash

sudo apt update

## PACKAGES
packages=(
  git
  git-core
  build-essential
  openssl
  libssl-dev
  zsh
  tmux
  vim
  xclip
  fzf
  traceroute
  net-tools
  nmap
  zenmap
  python3-pip
  ruby
  jq 
  yq  
  neofetch
)



desktop_packages=(
  vlc
  vlc-bin 
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
cp ../Configs/profile $HOME/.profile
cp ../Configs/tmux.conf $HOME/.tmux.conf
echo
echo

sleep 2

# Set Default python to python3
#sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 10
#sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10

## For SSH Key
echo '[!!]'
echo 'Dont Forget to create ssh key'
echo 'ssh-keygen -t rsa -b 4096 -C "your_email@gmail.com"'

sudo chsh -s $(which zsh)
source ~/.zshrc

## ALIASES
echo "Exporting Aliases"
echo "alias pbcopy='xclip -selection clipboard'" >> $HOME/.profile
echo "alias pwdc='pwd | xclip -selection clipboard'" >> $HOME/.profile
echo
echo


sudo update-alternatives --config editor
