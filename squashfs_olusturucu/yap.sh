#!/bin/sh
#Degişken ayarı
cd ..
DEBIAN_POOL=$(cat ../config/pool)
SECURITY_POOL=$(cat ../config/security_pool)
arch=$(cat ./config/arch)
#Ana ayarlar
lb config --distribution stretch
lb config --debian-installer false 
lb config -a $arch --verbose --apt apt --parent-distribution stretch --distribution stretch --binary-images iso-hybrid 
lb config --system live 
lb config --parent-distribution stretch 
lb config --firmware-binary false
lb config --binary-images iso-hybrid
lb config --initramfs live

#Depo ayarları
lb config --parent-archive-areas "main contrib non-free"
lb config --parent-mirror-bootstrap $DEBIAN_POOL
lb config --mirror-bootstrap $DEBIAN_POOL
lb config --parent-mirror-chroot $DEBIAN_POOL
lb config --parent-mirror-chroot-security $SECURITY_POOL
lb config --mirror-chroot $DEBIAN_POOL
lb config --mirror-chroot-security $SECURITY_POOL
lb config --parent-mirror-binary $DEBIAN_POOL
lb config --parent-mirror-binary-security $SECURITY_POOL
lb config --mirror-binary $DEBIAN_POOL
lb config --mirror-binary-security $SECURITY_POOL
lb config --mirror-debian-installer $DEBIAN_POOL

# Ek ayarlar
lb config --iso-application "Pardus"
lb config --checksums none
lb config --apt-recommends false
lb config --security             true
lb config --memtest none
lb config --source false 
lb config --iso-preparer  "Pardus"
lb config --iso-publisher "Pardus_Topluluk"
lb config --bootloader isolinux
lb config --interactive shell
lb config --hdd-size 10000 
lb config --win32-loader true
lb config --debian-installer-gui false
lb config --debian-installer true
lb build 2>&1 | tee build.log
