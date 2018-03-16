#!/bin/bash
cd ..
debootstrap  --no-check-gpg  --arch=$(cat ./config/arch)  $(cat ./config/dist)  ./chroot  $(cat ./config/pool)
chroot chroot apt-get update
chroot chroot apt-get install live-config live-boot curl grub2

