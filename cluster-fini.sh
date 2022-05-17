#!/bin/bash

. config.sh

kubectl delete -f $OPERATOR_DIR/toolbox.yaml
kubectl delete -f $CLUSTER_CR

sudo rm -rf /var/lib/rook
ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %
sudo rm -rf /dev/mapper/ceph-*
