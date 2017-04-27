#!/bin/bash
mkdir /mnt/iso/ 
cd ../ 
if [ -f config/iso ]
then
iso="$(cat config/iso)"
else
echo "$(cat malzeme/$(cat config/lang)/6)"
read iso
echo "$iso" > ./config/iso
fi
#iso=$(zenity -file-selection)
umount /mnt/iso
mount  $iso /mnt/iso/ 
mkdir /mnt/squashfs/ 
if [ -f /mnt/iso/live/filesystem.squashfs ]
then
squashfs=/mnt/iso/live/filesystem.squashfs
else
echo "$(cat malzeme/$(cat config/lang)/7)" 
read squashfs
fi
unsquashfs $squashfs
mv squashfs-root chroot 
echo "nameserver 8.8.8.8" > ./chroot/etc/resolv.conf
mount --bind /dev/ ./chroot/dev/
mount --bind /proc/ ./chroot/proc/
mount --bind /sys/ ./chroot/sys/
