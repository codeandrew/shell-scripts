#!/bin/bash 

sudo apt install -y \
  coreutils \
  tmux \
  x-clip
  
wget https://raw.githubusercontent.com/codeandrew/shell-scripts/master/Configs/ubuntu_profile 
mv ubuntu_profile ~/.myprofile
wget https://raw.githubusercontent.com/codeandrew/shell-scripts/master/Configs/tmux.conf 
mv tmux.conf ~/.tmux.conf

curl -sLf https://spacevim.org/install.sh | bash
mkdir -p ~/.SpaceVim/autoload/
mkdir -p  ~/.SpaceVim.d/

wget https://raw.githubusercontent.com/codeandrew/shell-scripts/master/SpaceVim/init.toml 
mv init.toml  ~/.SpaceVim.d/init.toml

wget https://raw.githubusercontent.com/codeandrew/shell-scripts/master/SpaceVim/autoload/myspacevim.vim
mv myspacevim.vim ~/.SpaceVim/autoload/

mkdir -p ~/repo 
wget https://raw.githubusercontent.com/codeandrew/Kali-Linux-Dockerfile/master/scripts/auto-recon.sh  -O ~/repo/auto-recon.sh
chmod +x ~/repo/auto-recon.sh

echo "What is the Victim IP?"
read rhost

echo "export rhost=$rhost" >> $HOME/.myprofile
echo "source $HOME/.myprofile" >> $HOME/.bashrc


cd ~/repo 
pwd; ls -latr;
echo "SHELL: "
which $(echo $0)
source ~/.bashrc
