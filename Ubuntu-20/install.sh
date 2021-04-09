#!/bin/bash

sudo apt update

####################################
## Git 
####################################
echo "Generating Git Configs and SSH Keygen ..."

read -p "Git Config Email Address: " EMAIL
read -p "Git Config Full Name: " NAME


ssh-keygen -t rsa -b 4096 -C "${EMAIL}"
git config --global user.email "${EMAIL}"         
git config --global user.name "${NAME}"

####################################
## PACKAGES
####################################
packages=(
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
  fping
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

####################################
## CONFIGS
####################################
echo "Copying Configs ..."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
cp ../Configs/ubuntu_profile $HOME/.myprofile
cp ../Configs/tmux.conf $HOME/.tmux.conf
echo
echo

sleep 2

sudo chsh -s $(which zsh)
source ~/.zshrc
echo "source $HOME/.myprofile" >> $HOME/.zshrc

####################################
## Node JS
####################################
echo "Installing NodeJs"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash 
cat ./nvm.cfg >> $HOME/.myprofile  
source ~/.myprofile
nvm install node

sudo update-alternatives --config editor
