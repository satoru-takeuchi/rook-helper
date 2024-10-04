#!/bin/bash -xe

. config.sh

minikube start --driver=kvm2 --extra-disks 2
