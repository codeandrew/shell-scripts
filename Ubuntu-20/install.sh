#!/bin/bash

sudo apt update

####################################
## Git 
####################################
# Check if -i is passed
if [[ "$1" == "-i" ]]; then
    echo "Generating Git Configs and SSH Keygen ..."

    read -p "Git Config Email Address: " email
    read -p "Git Config Full Name: " name

    ssh-keygen -t rsa -b 4096 -C "${email}"
    git config --global user.email "${email}"
    git config --global user.name "${name}"
fi

####################################
## PACKAGES
####################################
packages=(
  git-core
  coreutils
  build-essential
  ncal
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
  #smbclient
  #nfs-common
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
cp ../Configs/.zshrc $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp ../Configs/ubuntu_profile $HOME/.myprofile
cp ../Configs/ubuntu-tmux.conf $HOME/.tmux.conf
echo
echo


sleep 2

####################################
## Node JS
####################################
echo "Installing NodeJs"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash 
cat ./nvm.cfg >> $HOME/.myprofile  
source ~/.myprofile
nvm install node

echo "3" | sudo update-alternatives --config editor
echo "zsh" >> $HOME/.bashrc

echo "[!] Do this this manually"
echo "sudo chsh -s $(which zsh)"
echo "source ~/.zshrc"
echo 'grep $(whoami) /etc/passwd'
echo "make sure to relogin and check your shell"
