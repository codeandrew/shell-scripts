#!/bin/sh
echo "Last Working Date: "
echo "2019-03-22"

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing Bash Completion"
brew install bash-completion

echo "Installing Oh My Z Shell"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


echo "Installing tmux"
brew install tmux

echo
echo
echo "Installing Gitlan Runner"
sudo curl --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-darwin-amd64
sudo chmod +x /usr/local/bin/gitlab-runner

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
