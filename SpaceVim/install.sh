#!/bin/sh

curl -sLf https://spacevim.org/install.sh | bash

cp init.toml ~/.SpaceVim.d/init.toml

cp ./autoload/myspacevim.vim $HOME/.SpaceVim/autoload/



