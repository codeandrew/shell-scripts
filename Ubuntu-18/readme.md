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

### K8s Info
Cloud Provider/Platform (AKS, GKE, Minikube etc.):
AWS / kubeadm



### HELM Troubleshoot

```
$ helm --tiller-namespace tiller-world version
Client: &version.Version{SemVer:"v2.12.1", GitCommit:"02a47c7249b1fc6d8fd3b94e6b4babf9d818144e", GitTreeState:"clean"}
Server: &version.Version{SemVer:"v2.12.1", GitCommit:"02a47c7249b1fc6d8fd3b94e6b4babf9d818144e", GitTreeState:"clean"}
$ 
```
or
```
$ export TILLER_NAMESPACE=tiller-world
$ helm version
Client: &version.Version{SemVer:"v2.12.1", GitCommit:"02a47c7249b1fc6d8fd3b94e6b4babf9d818144e", GitTreeState:"clean"}
Server: &version.Version{SemVer:"v2.12.1", GitCommit:"02a47c7249b1fc6d8fd3b94e6b4babf9d818144e", GitTreeState:"clean"}
$ 
```

> https://github.com/helm/helm/issues/4685
> link for helm tiller issue 

> https://github.com/helm/helm/issues/3130

Run this to Check
```
helm list
helm repo update
helm install --name nginx-ingress stable/nginx-ingress
```
