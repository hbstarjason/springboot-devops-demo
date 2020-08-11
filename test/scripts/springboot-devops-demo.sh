#!/bin/bash


set -e

CURRENT_DIR="$(cd "$(dirname $0)"; pwd)"

CHART_PATH="$CURRENT_DIR/../chart"

NAMESPACE="springboot-devops-demo"

# cd ${CHART_PATH}

helm repo add stable http://mirror.azure.cn/kubernetes/charts
helm repo up

# helm lint ./charts

sudo sysctl -w vm.max_map_count=262144
sudo sysctl -w vm.drop_caches=1
sudo sysctl -w vm.drop_caches=3

echo "springboot-devops-demo Deploy"

kubectl create ns ${NAMESPACE}
helm install springboot-devops-demo  ./charts/ -f ./charts/values.yaml -n $NAMESPACE

helm list -n $NAMESPACE
kubectl get pod -n $NAMESPACE
echo "springboot-devops-demo deployed successfully"
