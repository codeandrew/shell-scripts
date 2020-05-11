#!/bin/sh

echo $(cat ./sources.list) >> /etc/apt/sources.list
apt-get update -y
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


