#!/bin/sh

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh


echo "Creating tiller"
#helm init --service-account tiller
helm init

echo
helm version
