#!/bin/bash
konum=$(pwd)
cd ..
if [ -f ./config/chroot ]
then
chrootx=$(cat ./config/chroot)
else
echo "$(cat malzeme/$(cat config/lang)/1)"
read chrootx
fi
rm -rf $chrootx/var/log/*
rm -rf $chrootx/var/cache/apt/archives/*
rm -rf $chrootx/root/*
cp -prf $chrootx/etc/skel/* $chrootx/root/
rm -rf $chrootx/var/lib/apt/lists/*
cd $konum
mksquashfs $chrootx ./filesystem.squashfs -comp xz -wildcards
if [ -f ./config/binary ]
then
rm -f $(cat ./config/binary)
mv ./filesystem.squashfs $(cat ./config/binary)/live/filesystem.squashfs
cp -f $(cat ./config/chroot)/boot/initrd.img* $(cat ./config/binary)/live/initrd.img
mkdir $(cat ./config/binary)/live
cp -f $(cat ./config/chroot)/boot/vmlinuz* $(cat ./config/binary)/live/vmlinuz
fi
