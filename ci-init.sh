#!/bin/bash

export KUBECONFIG=$HOME/admin.conf \
    PATH="/tmp/rook-tests-scripts-helm/linux-amd64:$PATH" \
    TEST_HELM_PATH=/tmp/rook-tests-scripts-helm/linux-amd64/helm \
    TEST_BASE_DIR="$(pwd)" \
    STORAGE_PROVIDER_TESTS=ceph \
    TEST_SCRATCH_DEVICE=/dev/sdb \
    KUBE_VERSION=v1.14.10

tests/scripts/kubeadm.sh up
tests/scripts/helm.sh up

_output/tests/linux_amd64/integration -test.v -test.timeout 7200s -test.run 'TestCephMultiClusterDeploySuite' 2>&1 | tee _output/tests/integrationTests.log

