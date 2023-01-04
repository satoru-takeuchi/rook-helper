#!/bin/bash

. config.sh

kubectl -n rook-ceph patch cephcluster my-cluster --type merge -p '{"spec":{"cleanupPolicy":{"confirmation":"yes-really-destroy-data"}}}'

kubectl delete -f $OPERATOR_DIR/toolbox.yaml
kubectl delete -f $CLUSTER_CR

sudo rm -rf /var/lib/rook
ls /dev/mapper/ceph-* | xargs -I% -- sudo dmsetup remove %
sudo rm -rf /dev/mapper/ceph-*
