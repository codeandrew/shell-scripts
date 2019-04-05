# Ubuntu 18 Scripts


## Basic
- git
- zshell
- tmux

## Devops
Contents
- Docker
- Kubernetes
- kubeadm
- kubectl
- kubelet
- flannel
- awscli


### Important
#### Order of installation
1. install.sh
2. devops.sh
3. k8s-master.sh (Master Node Only)
> save the kudeadm hash for the working
4. k8s-networking.sh (Master Node Only)

** For Master node only **
- k8s-master.sh
- k8s-networking.sh


### Kubernetes Commands
```
kubectl version
```
> To Check if Running


```
kubectl get nodes
```
> To check connected nodes and statuses


```
kubectl get pods -n kube-system

```
> To Get the Running Pods of the Kubernetes system
