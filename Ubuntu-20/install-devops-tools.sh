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
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
which aws
aws --version


