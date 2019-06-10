#!/bin/sh
sudo apt update
sudo apt install git

git --version

sudo apt install zsh
echo shell

echo "Installing Oh My Z Shell"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo apt-get install tmux

## For SSH Key
echo '[!!]'
echo 'Dont Forget to create ssh key'
echo 'ssh-keygen -t rsa -b 4096 -C "your_email@gmail.com"'
