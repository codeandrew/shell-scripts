#!/bin/sh
echo "Last Working Date: "
echo "2019-03-22"
echo "2019-07-11"

EMAIL="jeanandrewfuentes@gmail.com"

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

packages=(
  python
  vim
  tree 
  tmux 
  nvm
)

for package in "${packages[@]}"; do 
  echo "---------------------------------------------------------------------"
  echo "installing $package" 
  brew install $package
  echo 
  echo "---------------------------------------------------------------------"
done

echo "Generating ssh keygen"
ssh-keygen -t rsa

cp ../Configs/tmux.conf $HOME/.tmux.conf
tmux source-file $HOME/.tmux.conf

echo "Installing Oh My Z Shell"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp ../Configs/profile $HOME/.profile
echo "source $HOME/.profile" > .zshrc


echo "Installing NVM"
nvm install --latest-npm
nvm install 10

echo "Installing Vtop"
npm install -g vtop

Echo "Installing mdless"
gem install mdless

sudo easy_install pip

echo
echo
echo
echo
echo "In .zshrc:"
echo "change ZSH_THEME=robbyrussell to"
echo "ZSH_THEME=bira"
