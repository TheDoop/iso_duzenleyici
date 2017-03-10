#!/bin/bash
depo=""
konum=$(pwd)
if [ "$USER" = "root" ]
then
cat malzeme/$(cat config/lang)/menu
read secenek

if [ "$secenek" = "1" ]
then
clear
cd iso_cikartici
chmod +x ./cikart.sh
./cikart.sh
fi

if [ "$secenek" = "2" ]
then
clear
cd squashfs_yapici
chmod +x ./make.sh
./make.sh
fi

if [ "$secenek" = "3" ]
then
clear
cd iso_olusturucu
chmod +x ./binary.sh
./binary.sh
fi


if [ "$secenek" = "4" ]
then
clear
echo "$(cat malzeme/$(cat config/lang)/5)"
cd squashfs_olusturucu
chmod +x yap.sh
./yap.sh
fi

if [ "$secenek" = "5" ]
then
clear
cat $(cat malzeme/$(cat config/lang)/howto)
fi


if [ "$secenek" = "6" ]
then
clear
exit
fi

if [ "$secenek" = "7" ]
then
clear
echo "$(cat malzeme/$(cat config/lang)/11)[$(ls ./malzeme)]"
read lang
echo "$lang" > ./config/lang
echo "$(cat malzeme/$(cat config/lang)/1)"
read chrootx
echo "$(cat malzeme/$(cat config/lang)/2)"
read binaryx
echo "$(cat malzeme/$(cat config/lang)/8)"
read pool
echo "$(cat malzeme/$(cat config/lang)/9)"
read secpool
echo "$(cat malzeme/$(cat config/lang)/10)"
read arch
echo "$arch" > ./config/arch
echo "$pool" > ./config/pool
echo "$secpool" > ./config/security_pool
echo "$chrootx" > ./config/chroot
echo "$binaryx" > ./config/binary
fi

cd $konum
echo "$(cat malzeme/$(cat config/lang)/3)"
read duraklama
clear

else
echo "$(cat malzeme/$(cat config/lang)/4)"
exit
fi
