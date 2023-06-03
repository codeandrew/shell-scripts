#!/bin/bash

echo "[+] Installing Docker"
curl https://get.docker.com | bash
sudo groupadd docker
sudo usermod -aG docker ${USER}
docker run hello-world


echo "[+] Installing Kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client


echo "[+] Installing Dive for Docker Investigations"
wget https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb
sudo apt install ./dive_0.9.2_linux_amd64.deb


sudo apt install -y \
    python3-pip \
    kubectl \


echo "[+] Installing AWS CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
which aws
aws --version


echo "[+] Installing Azure CLI"
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash


echo "[+] Need to relogin and check id"
echo "su - ${USER}"
