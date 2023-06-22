#!/bin/bash

check_amd64_architecture() {
	local arch
	arch=$(uname -m)

	if [ "$arch" != "x86_64" ]; then
		echo "Error: This script requires an amd64 architecture."
		exit 1
	fi
}
check_amd64_architecture

set -x
sudo apt install software-properties-common apt-transport-https wget -y

wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg


echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt update
sudo apt install code -y
