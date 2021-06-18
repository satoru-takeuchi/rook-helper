#!/bin/bash

#if [ $# != 1 ] ; then
#  echo "usage: $0 <commit>" >&2
#  exit 1
#fi

#COMMIT=$1

#git checkout $COMMIT
export KUBECONFIG=~/admin.conf
#make -j8 IMAGES=ceph
#docker tag build-e388186c/ceph-amd64 rook/ceph:master

for i in common crds operator ; do
  kubectl apply -f cluster/examples/kubernetes/ceph/${i}.yaml
done

kubectl apply -f local.yaml
#kubectl apply -f local2.yaml
kubectl apply -f cluster-on-pvc.yaml
kubectl apply -f cluster/examples/kubernetes/ceph/toolbox.yaml
kubectl -n rook-ceph get pod -w

#TOOLBOXPOD=$(kubectl -n rook-ceph get pod -lapp=rook-ceph-tools -o jsonpath='{.items[0].metadata.name}')
