#!/bin/sh
echo "Setuping Up Master Node"

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "COPY THE kubeadm join and run it with sudo in the worker nodes"
echo "And run K8s-networking.sh"
