#!/bin/bash

export KUBECONFIG=$HOME/admin.conf \
    KUBE_VERSION=v1.18.6

tests/scripts/kubeadm.sh up
