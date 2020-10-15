#!/bin/bash -x

export KUBECONFIG=$HOME/admin.conf

sudo rm -rf /var/lib/etcd
sudo rm -rf /etc/kubernetes
sudo rm -rf /var/lib/rook
tests/scripts/helm.sh clean
tests/scripts/kubeadm.sh clean
sudo vgremove --yes --force rook-integration-test-vg
sudo pvremove --yes --force ${test_scratch_device}
sudo dd if=/dev/zero of=/dev/sdb bs=1M count=100 oflag=dsync,direct
