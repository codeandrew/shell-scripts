#!/bin/sh

packages=( ansible azure-cli bash-completion bat docker-machine docker-machine-driver-xhyve doctl freetype gdbm gettext glib ilmbase
  imagemagick jpeg jq k9s kubernetes-cli kustomize libde265 libevent libffi libheif libidn2 libomp libpng libtiff libtool libunistring
  libyaml little-cms2 lua ncurses neofetch netcat nvm oniguruma openexr openjpeg openshift-cli openssl@1.1 pcre perl python
  readline ruby screenresolution shared-mime-info socat sqlite terraform tmux tree vim
  webp wget x265 xz yq zsh-autosuggestions zsh-completions zsh-syntax-highlighting
)

cask_packages= ( docker minishift 
)

for package in "${packages[@]}"; do 
  echo "---------------------------------------------------------------------"
  echo "installing $package" 
  brew install $package
  echo 
  echo "---------------------------------------------------------------------"
done
