#!/bin/bash

echo $(cat ./sources.list) >> /etc/apt/sources.list

read -p "Make sure to Disable the Screen Lock, as it \
  corrupts the installation process"

apt-get clean
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y

packages=(
  beef-xss
)

for package in "${packages[@]}"
do
  echo "---------------------------------"
  echo "Installing $package"
  echo
  apt-get -y install $package
  echo
  echo "---------------------------------"
  echo
  echo
done


