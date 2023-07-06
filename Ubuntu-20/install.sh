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
  coreutils
  build-essential
  wget
  curl
  vim
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
  smbclient
  nmap
  python-pip
  python3-pip
  ruby
  jq 
  yq  
  neofetch
  mysql-client
  language-pack-en
)

for package in "${packages[@]}"
do
  echo "---------------------------------"
  echo "Installing $package"
  echo
  sudo DEBIAN_FRONTEND=noninteractive apt -y install $package
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
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp ../Configs/ubuntu_profile $HOME/.myprofile
cp ../Configs/tmux.conf $HOME/.tmux.conf
echo
echo

####################################
## SpaceVim
####################################

echo "[+] Install SpaceVim"
curl -sLf https://spacevim.org/install.sh | bash
mkdir -p ~/.SpaceVim/autoload/
mkdir -p  ~/.SpaceVim.d/

wget https://raw.githubusercontent.com/codeandrew/shell-scripts/master/SpaceVim/init.toml 
mv init.toml  ~/.SpaceVim.d/init.toml

wget https://raw.githubusercontent.com/codeandrew/shell-scripts/master/SpaceVim/autoload/myspacevim.vim
mv myspacevim.vim ~/.SpaceVim/autoload/

sleep 2

####################################
## Node JS
####################################
echo "Installing NodeJs"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash 
cat ./nvm.cfg >> $HOME/.myprofile  
source ~/.myprofile
nvm install node


sudo update-alternatives --config editor

echo "source $HOME/.myprofile" >> $HOME/.zshrc
echo "zsh" >> $HOME/.bashrc

echo "[!] Do this this manually"
echo "sudo chsh -s $(which zsh)"
echo "source ~/.zshrc"
echo 'grep $(whoami) /etc/passwd'
echo "make sure to relogin and check your shell"
