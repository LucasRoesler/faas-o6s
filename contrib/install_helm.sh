#!/bin/bash

curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
helm version -c
helm init --client-only
