#!/bin/bash -xe

. config.sh

CONFFILE=/etc/kubernetes/admin.conf

sudo kubeadm init --pod-network-cidr 10.244.0.0/16
sudo cp $CONFFILE ~/
sudo chown $(id -u):$(id -g) ~/admin.conf
sudo kubectl --kubeconfig $CONFFILE taint nodes --all node-role.kubernetes.io/control-plane- node-role.kubernetes.io/master-
sudo kubectl --kubeconfig $CONFFILE apply -f https://raw.githubusercontent.com/flannel-io/flannel/v0.16.3/Documentation/kube-flannel.yml
