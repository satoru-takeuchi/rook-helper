#!/bin/bash -x

export KUBECONFIG=$HOME/admin.conf \
    KUBE_VERSION=v1.19.2

#kubectl delete -f cluster-on-pvc.yaml
#kubectl delete -f operator.yaml
#kubectl delete -f crds.yaml
#kubectl delete -f common.yaml
kubectl delete -f local.yaml
tests/scripts/kubeadm.sh clean
sudo rm -rf /var/lib/rook
sudo rm -rf /var/lib/etcd
sudo rm -rf /etc/kubernetes
sudo vgremove --yes --force rook-integration-test-vg
sudo pvremove --yes --force ${test_scratch_device}
for DISK in /dev/sdb; do
  sudo sgdisk --zap-all ${DISK}
  sudo dd if=/dev/zero of=${DISK} bs=1M count=100 oflag=dsync,direct
  sudo blkdiscard ${DISK}
done
ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %
sudo rm -rf /dev/mapper/ceph-*
