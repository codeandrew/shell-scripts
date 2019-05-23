#!/bin/sh
#kubectl delete secret regcred -n ghost-dev

echo "Logging in AWS CLI"
eval $( aws ecr get-login --registry-ids 925884704068 --region ap-southeast-1 --no-include-email)

echo
echo
echo
echo "Creating kubernetes secret"
kubectl create secret generic regcred \
	    --from-file=.dockerconfigjson=$HOME/.docker/config.json \
	        --type=kubernetes.io/dockerconfigjson -n dev
