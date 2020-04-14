#!/bin/bash -xe

DISK=/dev/sdb

rm -rf /var/lib/rook
/sgdisk --zap-all $DISK
dd if=/dev/zero of="$DISK" bs=1M count=100 oflag=direct,dsync
FILES=$(ls /dev/mapper/ceph-* 2>/dev/null || :)
echo "${FILES}" | xargs -I% -- /dmsetup remove %
rm -rf /dev/mapper/ceph-*
rm -rf /dev/ceph-*
