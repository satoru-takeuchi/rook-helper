#!/bin/bash

export KUBECONFIG=$HOME/admin.conf \
    KUBE_VERSION=v1.19.2

tests/scripts/kubeadm.sh up
