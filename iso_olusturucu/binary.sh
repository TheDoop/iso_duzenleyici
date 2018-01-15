cd ..
xorriso -as mkisofs \
        -iso-level 3 -rock -joliet \
        -max-iso9660-filenames -omit-period \
        -omit-version-number -relaxed-filenames -allow-lowercase \
        -volid "CustomLiveIso" \
        -eltorito-boot isolinux/isolinux.bin \
        -eltorito-catalog isolinux/isolinux.cat \
        -no-emul-boot -boot-load-size 4 -boot-info-table \
        -eltorito-alt-boot -e boot/grub/efi.img -isohybrid-gpt-basdat -no-emul-boot \
        -isohybrid-mbr $(cat ./config/binary)/isolinux/isohybrid-mbr \
-output "live-image-amd64.hybrid.iso" $(cat ./config/binary) 
