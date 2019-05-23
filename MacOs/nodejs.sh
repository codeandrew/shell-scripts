#!/bin/sh

echo "Downloading Node Version Manager"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

echo "Installing latest Node"
nvm install node

echo "Installing Vtop"
npm install -g vtop
