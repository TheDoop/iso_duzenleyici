#!/bin/bash

cd ..
if [ -d ./config/chroot ]
then
chrootx=$(cat ./config/chroot)
else
echo "$(cat malzeme/$(cat config/lang)/1)"
read chrootx
fi
mksquashfs $chrootx ./filesystem.squashfs -comp xz -wildcards
if [ -d ./config/binary ]
then
rm -f $(cat ./config/binary)
mv ./filesystem.squashfs $(cat ./config/binary)/live/filesystem.squashfs
cp -f $(cat ./config/chroot/)/boot/initrd.img* $(cat ./config/binary)/live/initrd.img
mkdir $(cat ./config/binary)/live 2>&1 /dev/null
cp -f $(cat ./config/chroot/)/boot/vmlinuz* $(cat ./config/binary)/live/vmlinuz
fi
