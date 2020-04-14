#!/bin/bash -xe

DISK=/dev/sdb

kubectl delete -f manifests/cluster.yaml
while : ; do
	echo waiting for deleting ceph cluster...
	sleep 5
	NCLUSTER=$(kubectl -n rook-ceph get cephcluster -o json | jq '.items | length')
	if [ "${NCLUSTER}" -eq 0 ] ; then
		break
	fi
done
kubectl delete -f manifests/operator.yaml
kubectl delete -f manifests/common.yaml
kind delete cluster
sudo sgdisk --zap-all $DISK
sudo dd if=/dev/zero of="$DISK" bs=1M count=100 oflag=direct,dsync
