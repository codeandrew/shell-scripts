#!/bin/bash

#Update fresh Vagrant 
apt-get update
apt-get upgrade

# Git 
apt-get install git
echo '[!!]'
echo '[*] Done Installing Git'

# Mysql 5.7
apt-get install mysql-server
systemctl status mysql
mysql_secure_installation
echo '[!!]'
echo '[*] Done Installing MySQL'

# NginX
apt-get install nginx
echo '[!!]'
echo '[*] Done Installing Nginx'

## PHP 7.2 for ubuntu16
sudo apt-get install -y software-properties-common
add-apt-repository ppa:ondrej/php
apt-get update
apt-get install php7.2 php7.2-fpm php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml

echo '[!!]'
echo '[*] Done Installing Php 7.2'

## For SSH Key
echo '[!!]'
echo 'Dont Forget to create ssh key'
echo 'ssh-keygen -t rsa -b 4096 -C "your_email@gmail.com"'
