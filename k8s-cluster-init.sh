#!/bin/bash -xe

. config.sh

CONFFILE=/etc/kubernetes/admin.conf

sudo kubeadm init --pod-network-cidr 10.244.0.0/16
sudo cp $CONFFILE ~/
sudo chown $(id -u):$(id -g) ~/admin.conf
sudo kubectl --kubeconfig $CONFFILE taint nodes --all node-role.kubernetes.io/master- || :
# node-role.kubernetes.io/control-plane taint only exist in >= kubeadm v1.24
sudo kubectl --kubeconfig $CONFFILE taint nodes --all node-role.kubernetes.io/control-plane- || :
sudo kubectl --kubeconfig $CONFFILE apply -f https://raw.githubusercontent.com/flannel-io/flannel/v0.22.2/Documentation/kube-flannel.yml
