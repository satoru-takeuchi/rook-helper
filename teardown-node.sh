#!/bin/bash -xe

DISK=/dev/sdb

rm -rf /var/lib/rook
/sgdisk --zap-all $DISK
dd if=/dev/zero of="$DISK" bs=1M count=100 oflag=direct,dsync
ls /dev/mapper/ceph-* | xargs -I% -- /dmsetup remove %
rm -rf /dev/mapper/ceph-*
rm -rf /dev/ceph-*
