#!/bin/sh

curl -sLf https://spacevim.org/install.sh | bash
mkdir -p ~/.SpaceVim/autoload/
mkdir -p  ~/.SpaceVim.d/

cp init.toml ~/.SpaceVim.d/init.toml
cp ./autoload/myspacevim.vim $HOME/.SpaceVim/autoload/
