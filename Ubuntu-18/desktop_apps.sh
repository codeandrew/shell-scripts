#!/bin/bash

sudo apt update

desktop_packages=(
  vlc
  vlc-bin 
)

echo "Installing Desktop Packages"

for package in "${desktop_packages[@]}"
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

echo
echo "Installing Monitoring System "
wget https://github.com/oguzhaninan/Stacer/releases/download/v1.0.4/Stacer_1.0.4_amd64.deb
sudo dpkg --install Stacer_1.0.4_amd64.deb

echo
echo

