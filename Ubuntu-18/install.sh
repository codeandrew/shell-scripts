#!/bin/sh
sudo apt update
sudo apt install git

git --version

sudo apt-get update && sudo apt-get -y install zsh
zsh --version

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

chsh -s /bin/zsh

sudo apt-get install tmux

# Install pip
sudo apt install python3-pip
# Set Default python to python3
update-alternatives --install /usr/bin/python python /usr/bin/python3.6 10
update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10

## For SSH Key
echo '[!!]'
echo 'Dont Forget to create ssh key'
echo 'ssh-keygen -t rsa -b 4096 -C "your_email@gmail.com"'
