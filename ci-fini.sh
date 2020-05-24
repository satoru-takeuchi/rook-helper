#!/bin/bash -x

export KUBECONFIG=~/admin.conf

tests/scripts/helm.sh clean
tests/scripts/kubeadm.sh clean
