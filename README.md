A simple Rook/Ceph cluster constructor for testing.

It provides the following features.

- Creates a simple K8s cluster for the CI of Rook/Ceph
- Destroy the above-mentioned cluster.

The target version is Rook v1.3.6.

# Usage

## Prerequisite

This programs is only tests in Ubuntu 18.04 environment.

The following tools should be installed.

- kubectl

There should be the scratch device `/dev/sdb` for a OSD. If you want to change the scratch device name, you should modify scripts by yourself.


## Preparation

Copy scripts to the test environment.

```console
cp ci-* ${GOPATH}/src/github.com/rook/rook
cd ${GOPTH}/src/github.com/rook/rook
```

## Construct a K8s cluster and a Rook/Ceph cluster

```console
./ci-init.sh
```

If you want to prepare your Rook cluster by yourself, please remove the last
two lines of ci-init.sh. Then this script just creates K8s cluster.

## Destroy both the Rook/Ceph cluster and the K8s cluster

```console
./ci-fini.sh
```
