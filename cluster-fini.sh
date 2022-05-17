#!/bin/bash

. config.sh

kubectl delete -f $OPERATOR_DIR/toolbox.yaml
kubectl delete -f $CLUSTER_CR

watch kubectl -n rook-ceph get pod

sudo rm -rf /var/lib/rook
for DISK in $DISKS ; do
   sudo sgdisk --zap-all ${DISK}
   sudo dd if=/dev/zero of=${DISK} bs=1M count=100 oflag=dsync,direct
   sudo blkdiscard ${DISK}
done

ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %
sudo rm -rf /dev/mapper/ceph-*
