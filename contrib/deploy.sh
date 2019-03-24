#!/bin/bash

export KUBECONFIG="$(kind get kubeconfig-path)"

kind load docker-image openfaas/openfaas-operator:latest

echo "Applying namespaces"
kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml

PASSWORD="something_random"
kubectl -n openfaas create secret generic basic-auth \
--from-literal=basic-auth-user=admin \
--from-literal=basic-auth-password="$PASSWORD"

echo "Installing OpenFaaS"
helm repo add openfaas https://openfaas.github.io/faas-netes/
helm install openfaas/openfaas \
    --name openfaas \
    --namespace openfaas  \
    --set basic_auth=true \
    --set functionNamespace=openfaas-fn \
    --set operator.create=true \
    --wait
