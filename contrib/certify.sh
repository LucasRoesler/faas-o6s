#!/bin/bash

export KUBECONFIG="$(kind get kubeconfig-path)"
export OPENFAAS_URL=http://127.0.0.1:31112/
git clone https://github.com/openfaas/certifier.git
cd certifier || exit 1
echo "Certifying openfaas-operator"
make test-kubernetes OPENFAAS_URL=http://127.0.0.1:31112/
