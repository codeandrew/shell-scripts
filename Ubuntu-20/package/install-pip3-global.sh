#!/bin/bash

packages=(
  requests
)

pip3 install package 

for package in "${packages[@]}"
do
  echo "---------------------------------"
  echo "Installing global $package"
  echo
  sudo pip3 install $package
  echo
  echo "---------------------------------"
  echo
  echo
done 
