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
  smbclient
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


wget https://raw.githubusercontent.com/CiscoCXSecurity/enum4linux/master/enum4linux.pl -O /usr/local/bin/enum4linux
sudo chmod +x /usr/local/bin/enum4linux
