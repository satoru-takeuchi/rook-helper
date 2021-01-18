#!/bin/bash -x

export KUBECONFIG=$HOME/admin.conf \
    TEST_BASE_DIR="$(pwd)" \
    STORAGE_PROVIDER_TESTS=ceph \
    TEST_SCRATCH_DEVICE=/dev/sdb \
    KUBE_VERSION=v1.19.2

kubectl delete -f local.yaml
tests/scripts/helm.sh clean
tests/scripts/kubeadm.sh clean
sudo vgremove --yes --force rook-integration-test-vg
sudo pvremove --yes --force ${test_scratch_device}
for DISK in /dev/sdb; do
  sudo sgdisk --zap-all ${DISK}
  sudo dd if=/dev/zero of=${DISK} bs=1M count=100 oflag=dsync,direct
  sudo blkdiscard ${DISK}
done
ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %
sudo rm -rf /dev/mapper/ceph-*
sudo rm -rf /var/lib/rook
