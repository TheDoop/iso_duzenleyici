#!/bin/bash
konum=$(pwd)
cd ..
if [ -f ./config/chroot ]
then
chrootx=$(cat ./config/chroot)
else
echo "$(cat malzeme/$(cat config/lang)/1)"
read chrootx
echo "$chrootx" > ./config/chroot
fi
rm -rf $chrootx/var/log/*
rm -rf $chrootx/var/cache/apt/archives/*
rm -rf $chrootx/root/*
cp -prf $chrootx/etc/skel/* $chrootx/root/
rm -rf $chrootx/var/lib/apt/lists/*
cd $konum
umount -f $chrootx/dev/
umount -f $chrootx/sys/
mksquashfs $chrootx ./filesystem.squashfs -comp xz -wildcards
mount --bind /dev/ $chrootx/dev/
mount --bind /sys/ $chrootx/sys/

