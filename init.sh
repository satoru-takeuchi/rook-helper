#!/bin/bash -xe

kind create cluster
kubectl apply -f manifests/common.yaml
kubectl apply -f manifests/operator.yaml
kubectl apply -f manifests/cluster-on-pvc.yaml
