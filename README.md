A simple scripts and manifests to create a simple Rook/Ceph cluster

It provides the following features.

- Run the integration test of Rook/Ceph
- Destroy the above-mentioned cluster.

The target version is Rook upstream/master: 14d4ed447ece23ec901bf39af2051601f82616f2

# Usage

## Prerequisite

This programs is only tests in Ubuntu 18.04 environment.

The following tools should be installed.

- kubectl

There should be the scratch device `/dev/sdb` for a OSD. If you want to change the scratch device name, you should modify scripts by yourself.

## installation

Copy scripts to the test environment.

```console
cp ci-* ${GOPATH}/src/github.com/rook/rook
cd $_
```

## Run the integration test

1. Ceate your Rook operator image with the following command.

```console
make -j$(grep -c processor) IMAGES=ceph
```

2. Run the following command.

```console
./ci-init.sh
```

3. Both the Rook/Ceph cluster and k8s cluster can be destroyed with the following command.

```console
./ci-fini.sh
```

## Prepare a k8s cluster to run your test

1. Create your Rook operator image.

2. Prepare your Rook manifests, typically common.yaml, operator.yaml, and cluster.yaml

3. Modify operator.yaml to use your operator image.

4. Run the following command to a K8s cluster.

```console
./own-cluster-init.sh
```

5. Apply Rook manifests like the followings.

```console
kubectl apply -f common.yaml
kubectl apply -f operator.yaml
kubectl apply -f cluster.yaml
```

6. Run your tests

7. Destroy both the Rook cluster and the K8s cluster as follows.

```
kubectl delete -f cluster.yaml
kubectl delete -f operator.yaml
kubectl delete -f common.yaml
./own-cluster-fini.sh
```
