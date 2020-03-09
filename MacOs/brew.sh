#!/bin/bash

## HOMEBREW 
echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

cask_packages=( docker minishift 
packages=(
	ansible azure-cli bash-completion bat docker-machine docker-machine-driver-xhyve doctl freetype gdbm gettext glib ilmbase
	imagemagick jpeg jq k9s kubernetes-cli kustomize libde265 libevent libffi libheif libidn2 libomp libpng libtiff libtool libunistring
	libyaml little-cms2 lua ncurses neofetch netcat nvm oniguruma openexr openjpeg openshift-cli openssl@1.1 pcre perl python
	readline ruby screenresolution shared-mime-info socat sqlite terraform tmux tree vim
	webp wget x265 xz yq zsh-autosuggestions zsh-completions zsh-syntax-highlighting
	cmake libcap libnet
)

cask_packages=( 
	docker virtualbox kubectl minishift 
)

i=0

for package in "${packages[@]}"; do 
  echo "---------------------------------------------------------------------"
  echo "installing $package" 
  brew install $package
  echo 
  echo "---------------------------------------------------------------------"
  echo 
  echo 
  ((i++))
done

echo "$i packages installed"

sleep 5

##############################################################################

## CONFIGURATION COPY

###  TMUX
echo "copying tmux.conf"
cp ../Configs/tmux.conf $HOME/.tmux.conf
tmux source-file $HOME/.tmux.conf
echo "---------------------------------------------------------------------"

