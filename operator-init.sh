#!/bin/bash

#if [ $# != 1 ] ; then
#  echo "usage: $0 <commit>" >&2
#  exit 1
#fi

#COMMIT=$1

#git checkout $COMMIT

. config.sh

#make -j8 IMAGES=ceph
#docker tag build-e388186c/ceph-amd64 rook/ceph:master

for i in common crds operator ; do
  kubectl apply -f $OPERATOR_DIR/${i}.yaml
done

CSI_OPERATOR_MANIFEST=$OPERATOR_DIR/csi-operator.yaml
if [ -e ${CSI_OPERATOR_MANIFEST} ] ; then
  kubectl apply -f ${CSI_OPERATOR_MANIFEST}
fi

watch kubectl -n rook-ceph get pod
