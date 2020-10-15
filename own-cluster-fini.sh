#!/bin/bash -x

export KUBECONFIG=$HOME/admin.conf

#kubectl delete -f cluster-on-pvc.yaml
#kubectl delete -f operator.yaml
#kubectl delete -f common.yaml
kubectl delete -f local.yaml
tests/scripts/kubeadm.sh clean
sudo rm -rf /var/lib/etcd
sudo rm -rf /etc/kubernetes
sudo rm -rf /var/lib/rook
sudo vgremove --yes --force rook-integration-test-vg
sudo pvremove --yes --force ${test_scratch_device}
sudo dd if=/dev/zero of=/dev/sdb bs=1M count=100 oflag=dsync,direct
