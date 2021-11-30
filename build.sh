#!/usr/bin/env sh
eval $(minikube -p minikube docker-env)

docker build -t tree_rest:latest -f Dockerfile .

kubectl describe namespaces tree || kubectl create namespace tree
for f in k8s/*.yaml; do kubectl apply -f $f; done
