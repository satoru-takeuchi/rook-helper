#!/bin/bash

. config.sh

DISKS=$@

for DISK in $DISKS ; do
   sudo sgdisk --zap-all ${DISK}
   sudo dd if=/dev/zero of="$DISK" bs=1K count=200 oflag=direct,dsync seek=0 # Clear at offset 0
   sudo dd if=/dev/zero of="$DISK" bs=1K count=200 oflag=direct,dsync seek=$((1 * 1024**2)) # Clear at offset 1GB
   sudo dd if=/dev/zero of="$DISK" bs=1K count=200 oflag=direct,dsync seek=$((10 * 1024**2)) # Clear at offset 10GB
   sudo dd if=/dev/zero of="$DISK" bs=1K count=200 oflag=direct,dsync seek=$((100 * 1024**2)) # Clear at offset 100GB
   sudo dd if=/dev/zero of="$DISK" bs=1K count=200 oflag=direct,dsync seek=$((1000 * 1024**2)) # Clear at offset 1000GB
   sudo blkdiscard ${DISK}
done
