A simple Rook/Ceph cluster constructor for testing.

It provides the following features.

- Creates a simple K8s cluster and a Rook/Ceph cluster on that K8s cluster.
- Destroy the above-mentioned cluster.

# Usage

## Prerequisite

This programs is only tests in Ubuntu 18.04 environment.

The following tools should be installed.

- kind
- jq
- kubectl
- sgdisk

There should be the scratch device `/dev/sdb` for a OSD. If you want to change the scratch device name, you should modify scripts by yourself.


## Construct a K8s cluster and a Rook/Ceph cluster

```console
./init.sh
```

## Destroy both the Rook/Ceph cluster and the K8s cluster

```console
./fini.sh
```

## Misc

You can watch the pods of the Rook/Ceph cluster with the following command.

```console
./watchpods.sh
```
