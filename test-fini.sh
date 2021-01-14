#!/bin/bash

export KUBECONFIG=~/admin.conf

kubectl delete -f cluster-on-pvc.yaml
#kubectl delete -f local2.yaml
for i in operator crds common ; do
  kubectl delete -f cluster/examples/kubernetes/ceph/${i}.yaml
done
kubectl delete -f local.yaml
sudo dd if=/dev/zero of=/dev/sdb bs=1M count=100 oflag=dsync,direct
#sudo dd if=/dev/zero of=/dev/sdc bs=1M count=100 oflag=dsync,direct
sudo rm -rf /var/lib/rook
