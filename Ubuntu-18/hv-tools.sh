#!/usr/bin/env bash

sudo apt update

## PACKAGES
packages=(
  build-essential
  libpcap-dev
  net-tools
  ruby-dev
  ruby
  nmap
  aircrack-ng
  dnsniff
  wireshark
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


