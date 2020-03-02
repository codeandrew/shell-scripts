#!/bin/sh
echo "Last Working Date: "
echo "2019-03-22"
echo "2019-07-11"

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing Python"
brew install python
echo "Installing Vim"
brew install vim
echo "Installing  Tree"
brew install tree

echo "Generating ssh keygen"
ssh-keygen -t rsa

echo "Installing Bash Completion"
brew install bash-completion

echo "Installing Oh My Z Shell"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


echo "Installing tmux"
brew install tmux

cp ../Configs/tmux.conf $HOME/.tmux.conf
tmux source-file $HOME/.tmux.conf

cp ../Configs/profile $HOME/.profile
echo "source $HOME/.profile" > .zshrc


echo
echo
echo "Installing Docker"
brew cask install docker

echo
echo
echo "Installing Virtual Box"
brew cask install virtualbox
echo
echo
echo "Allow Oracle Inc in Privacy and Security Policy"

echo
echo
echo "Installing kubernetes"
brew install kubectl

echo
echo
echo "Installing Minikube"
brew cask install minikube


echo "Installing NVM"
brew install nvm
nvm install --latest-npm
nvm install 10

echo "Installing Vtop"
npm install -g vtop


echo
echo
Echo "Installing mdless"
gem install mdless


echo
echo
echo
echo
echo "In .zshrc:"
echo "change ZSH_THEME=robbyrussell to"
echo "ZSH_THEME=bira"
