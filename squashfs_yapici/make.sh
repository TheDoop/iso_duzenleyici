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
cd $chrootx/root/
rm -rf ./{*,.*} 2> /dev/null
cp -prf $chrootx/etc/skel/ -T $chrootx/root/
rm -rf $chrootx/var/lib/apt/lists/*
cd $chrootx/tmp/
rm -rf ./{*,.*} 2> /dev/null
cd $konum
umount -Rf $chrootx/dev/pts/
umount -Rf $chrootx/proc/
umount -Rf $chrootx/sys/
umount -Rf $chrootx/dev/
mksquashfs $chrootx ./filesystem.squashfs -comp xz -wildcards
mount --bind /dev/ $chrootx/dev/
mount --bind /sys/ $chrootx/sys/
mount --bind /proc/ $chrootx/proc/
mount --bind /sys/ $chrootx/dev/pts/

