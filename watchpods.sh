#!/bin/bash -xe 

kubectl -n rook-ceph get pod -w
