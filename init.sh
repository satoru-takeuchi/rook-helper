#!/bin/bash -xe

sudo parted /dev/sdb -s mklabel gpt
sudo parted /dev/sdb -s mkpart CEPH_DATA ext4 0 6G
kind create cluster
kubectl apply -f manifests/common.yaml
kubectl apply -f manifests/operator.yaml
kubectl apply -f manifests/cluster.yaml
