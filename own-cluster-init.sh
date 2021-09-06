#!/bin/bash

export KUBECONFIG=$HOME/admin.conf \
    KUBE_VERSION=v1.21.4

tests/scripts/kubeadm.sh up
