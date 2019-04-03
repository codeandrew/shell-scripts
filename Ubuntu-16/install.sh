#!/bin/bash
apt-get update
apt-get upgrade

# Git
apt-get install git
echo '[!!]'
echo '[*] Done Installing Git'

echo "installing oh my zshell"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo apt-get install tmux

## For SSH Key
echo '[!!]'
echo 'Dont Forget to create ssh key'
echo 'ssh-keygen -t rsa -b 4096 -C "your_email@gmail.com"'
