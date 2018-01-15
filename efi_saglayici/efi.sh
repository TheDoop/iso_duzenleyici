if [ -f ../config/binary ]
then
echo ":"
else
echo "$(cat ../malzeme/$lang/2)"
read binaryx
if [ "$binaryx" == "" ]
then
pwd=$(pwd)
cd ..
echo "$(pwd)/iso_olusturucu/binary/" > ./config/binary
cd $pwd
else
echo "$binaryx" > ../config/binary
fi

fi
binary="$(cat ../config/binary)"
cp -pf $binary/boot/grub/efi.img efi.img
#mmd -i efi.img ::/EFI
#mmd -i efi.img ::/EFI/BOOT
#mmd -i efi.img ::/BOOT
#mmd -i efi.img ::/BOOT/GRUB
#mcopy -i efi.img $binary/efi/boot/BOOTx64.EFI ::/EFI/BOOT
#mcopy -i efi.img $binary/efi/boot/bootia32.EFI ::/EFI/BOOT
#mcopy -i efi.img $binary/efi/boot/grubx64.EFI ::/EFI/BOOT
#mcopy -i efi.img $binary/efi/boot/TRANS.TBL ::/EFI/BOOT
mcopy -i efi.img $binary/boot/grub/grub.cfg ::/BOOT/GRUB
#mcopy -i efi.img $binary/boot/grub/TRANS.TBL ::/BOOT/GRUB
#efi.img create
cp -pf efi.img $binary/boot/grub/efi.img
