#!/bin/sh
brew install doctl

echo "Do you have a digital ocean token? y/n"
read DO_TOKEN
if [ $DO_TOKEN == 'y']
then
  doctl auth init
fi

brew install kubectl
echo "Do you have existing kubeclt? y/n"
read KO_OVERWRITE
if [ $KO_OVERWRITE == 'y']
then
  brew link --overwrite kubernetes-cli
fi

echo "To Create k8s cluster in Digital ocean"
echo "doctl k8s cluster create example"
echo "kubectl config get-contexts"
echo "kubectl config use-context {context name}"

echo "Ready to continue y/N"
read SOMETHING

cd /tmp
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > install-helm.sh
chmod u+x install-helm.sh
./install-helm.sh

kubectl -n kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller
kubectl get pods --namespace kube-system
helm install stable/kubernetes-dashboard --name dashboard-demo
helm list
kubectl get services

