#!/bin/sh
echo "Last Working Date: "
echo "2019-03-22"
echo "2019-07-11"

banner(){
  echo; echo;
  MSG=$1
  echo "#==============================================================="
  echo "$MSG"
  echo "#==============================================================="
}

# PROFILE
banner "# I - PROFILE SETUP"

EMAIL="jeanandrewfuentes@gmail.com"
NAME="Jean Andrew Fuentes"

echo "Installing Oh My Z Shell"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp ../Configs/mac_profile $HOME/.myprofile
cp -rf .zshrc $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git config --global user.email "$EMAIL"
git config --global user.name "$NAME"

echo "Generating ssh keygen"
ssh-keygen -t rsa -b 4096 -C "$EMAIL"

# BREW PACKAGES
banner "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

packages=(
  python
  vim
  tree 
  tmux 
  azure-cli
  netcat 
  jq yq
)

for package in "${packages[@]}"; do 
  echo "---------------------------------------------------------------------"
  echo "installing $package" 
  brew install $package
  echo 
  echo "---------------------------------------------------------------------"
done

cp ../Configs/tmux.conf $HOME/.tmux.conf
tmux source-file $HOME/.tmux.conf

echo "Installing NVM"
./nodejs.sh