#!/bin/sh

echo "Creating Kubernetest Cluster"
echo "What's your cluster name"
read CLUSTER_NAME
doctl k8s cluster create $CLUSTER_NAME

doctl k8s cluster create \
   --region lon1 \
   --version 1.14.2-do.0 \
   --tag demo \
   --size s-2vcpu-4gb \
   --count 5 \
   --auto-upgrade \
   $CLUSTER_NAME

kubectl config get-contexts

echo "Do you already have helm? y/n"
read HELM
if [ HELM == 'n']
then
  cd /tmp
  curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > install-helm.sh
  chmod u+x install-helm.sh
  ./install-helm.sh
fi

kubectl -n kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller
kubectl get pods --namespace kube-system
helm install stable/kubernetes-dashboard --name dashboard-demo
helm list
kubectl get services


