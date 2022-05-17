#!/bin/bash

. config.sh

kubectl apply -f $CLUSTER_CR
kubectl apply -f $OPERATOR_DIR/toolbox.yaml
watch kubectl -n rook-ceph get pod
