#!/bin/bash -x

export KUBECONFIG=$HOME/admin.conf \
    PATH="/tmp/rook-tests-scripts-helm/linux-amd64:$PATH" \
    TEST_HELM_PATH=/tmp/rook-tests-scripts-helm/linux-amd64/helm \
    TEST_BASE_DIR="$(pwd)" \
    STORAGE_PROVIDER_TESTS=ceph \
    TEST_SCRATCH_DEVICE=/dev/sdb \
    KUBE_VERSION=v1.18.3

tests/scripts/helm.sh clean
tests/scripts/kubeadm.sh clean
sudo rm -rf /var/lib/etcd
sudo rm -rf /etc/kubernetes
