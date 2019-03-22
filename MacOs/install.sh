#!/bin/sh

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing Bash Completion"
brew install bash-completion

echo "Installing Docker"
brew cask install docker

echo "Installing Virtual Box"
brew cask install virtualbox

echo "Installing kubernetes"
brew install kubectl

echo "Installing Minikube"
brew cask install minikube
