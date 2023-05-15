#!/bin/bash

curl https://get.docker.com | bash
sudo groupadd docker
sudo usermod -aG docker $USER
$(echo $SHELL)
docker run hello-world

sudo apt install -y \
    python3-pip \
    kubectl \


echo "[+] Installing AWS CLI"
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
which aws
aws --version


