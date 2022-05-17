#!/bin/bash

. config.sh

DISKS=$@

for DISK in $DISKS ; do
   sudo sgdisk --zap-all ${DISK}
   sudo dd if=/dev/zero of=${DISK} bs=1M count=100 oflag=dsync,direct
   sudo blkdiscard ${DISK}
done
