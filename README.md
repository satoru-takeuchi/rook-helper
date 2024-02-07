A helper script to run the integration test of Rook and launch arbitrary Rook cluster.

# supported software versions

- rook: v1.13.2 or later
- minikube: v1.6.24 or later

# Usage

## Prerequisite

This programs is only tests in Ubuntu 22.04 environment.

The following tools should be installed.

- kubectl
- minikube
- containerd

There should be scratch devices for OSDs. By default("cluster-test.yaml"), Rook consumes all scratch devices for OSDs.

## Usage

Copy manifests from Rook source

```console
cd rook-helper
cp -a <rook dir>/deploy/examples
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

Then wipe all devices used for OSDs.

```console
./cleanup-devices <devices>
```

If "/dev/sdb" and "/dev/sdc" were consumed by Rook, run this script as follows.

```console
./cleanup-devices /dev/sdb /dev/sdc
```

Delete the Rook operator.

```console
./operator-fini.sh
```

Delete the K8s cluster.

```console
./k8s-cluster-fini.sh
```
