#!/bin/bash

export KUBECONFIG=~/admin.conf

kubectl delete -f cluster-on-pvc.yaml
#kubectl delete -f local2.yaml
for i in operator crds common ; do
  kubectl delete -f cluster/examples/kubernetes/ceph/${i}.yaml
done
kubectl delete -f local.yaml
sudo rm -rf /var/lib/rook
for DISK in /dev/sdb; do
  sudo sgdisk --zap-all ${DISK}
  sudo dd if=/dev/zero of=${DISK} bs=1M count=100 oflag=dsync,direct
  sudo blkdiscard ${DISK}
done
ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %
sudo rm -rf /dev/mapper/ceph-*
