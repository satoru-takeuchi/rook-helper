A helper script to run the integration test of Rook and launch arbitrary Rook cluster.

# supported Rook versions

- v1.9.3 or later

# Usage

## Prerequisite

This programs is only tests in Ubuntu 20.04 environment.

The following tools should be installed.

- kubectl
- kubeadm

There should be scratch devices for OSDs. Bu default, "/dev/sdb" is used. Change "DEVICES" parameter in "config.sh" if necessary.

## installation

Copy scripts to the test environment.

```console
cp *.sh ${GOPATH}/src/github.com/rook/rook
cd $_
```

## Usage

Deploy a K8s cluster.

```console
./k8s-cluster-init.sh
```

Deploy a Rook operator.

```console
./operator-init.sh
```

Deploy a Rook cluster.

```console
./cluster-init.sh
```

Now you can ready to use your Rook cluster.

## Cleanup

If you want to destroy your cluster, run the following script.

```console
./cluster-fini.sh
```

Delete the Rook operator.

```console
./operator-fini.sh
```

Delete the K8s cluster.

```console
./k8s-cluster-fini.sh
```
