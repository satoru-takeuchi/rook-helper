#!/bin/bash -x

kubectl delete -f manifests/cluster.yaml
while : ; do
	NCLUSTER=$(kubectl -n rook-ceph get cephcluster -o json | jq '.items | length')
	if [ "${NCLUSTER}" -eq 0 ] ; then
		break
	fi
done
kubectl delete -f manifests/operator.yaml
kubectl delete -f manifests/common.yaml
docker cp /sbin/sgdisk kind-control-plane:/
docker cp /sbin/dmsetup kind-control-plane:/
docker cp teardown-node.sh kind-control-plane:/
docker exec kind-control-plane /teardown-node.sh
kind delete cluster
