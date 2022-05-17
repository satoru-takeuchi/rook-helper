#!/bin/bash

. config.sh

for i in operator crds common ; do
  kubectl delete -f $OPERATOR_DIR/$i.yaml
done
