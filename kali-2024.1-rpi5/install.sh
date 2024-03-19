#!/bin/bash


packages=(
  util-linux
  util-linux-extra
  gobuster
  beef-xss
  build-essential
  coreutils
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


git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
echo "source $HOME/.myprofile" >> $HOME/.zshrc

cat ../Configs/ubuntu_profile >> $HOME/.myprofile
cp ../Configs/tmux.conf $HOME/.tmux.conf
echo
echo

echo "source $HOME/.myprofile" >> $HOME/.zshrc

mkdir -p ~/repo 
wget https://raw.githubusercontent.com/codeandrew/Kali-Linux-Dockerfile/master/scripts/auto-recon.sh  -O ~/repo/auto-recon.sh
chmod +x ~/repo/auto-recon.sh
