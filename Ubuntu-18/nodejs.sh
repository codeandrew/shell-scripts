#!/bin/sh
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v

echo "Do you want a node express generator? y or n"
read EXPRESS
if [ $EXPRESS == 'y']
then
	npx express-generator
	npm install -g express-generator
	sudo npm install -g express-generator

	echo " To generate express"

	echo "cd ~/rep"
	echo "express myapp"
	echo "cd myapp/ "
	echo "npm install"
	echo "npm start"
fi


