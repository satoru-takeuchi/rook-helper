#!/bin/bash -xe

. config.sh

minikube start --driver=none --container-runtime=containerd
