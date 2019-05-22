
brew install doctl
doctl auth init

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

