# iso_duzenleyici

Nasıl kullanılır?

4 alt programdan oluşur.

1- iso çıkartıcı:
Bu program elinizdeki iso dosyasını chroot olarak çıkartmanıza yarar. 
chroot üzerinde değişiklik yapmanıza olanak sağlar.

2- squashfs yapıcı:
Bu program daha önceden düzenlediğiniz yada sıfırdan oluşturduğunuz chrootu 
XZ sıkıştırması ve block size 512 kb olacak biçimde sıkıştırır. Daha sonra
bu squashfs dosyasını live isonuza eklebilirsiniz.

3- iso oluşturucu
Bu program ile birlikte gelen hazır şablonu kullanarak isohybrid biçiminde
bir live iso oluşturur. Bu live isoyu DVD/USB üzerine yazıp kurulum 
yapabilirsiniz.

4- chroot oluşturucu
Bu program debootstrap aracılığı ile chroot oluşturmaya yarar. Bu chroot
dosyasını live isoya ekleyebilirsiniz. Daha sonra isterseniz de iso çıkarıcı
ile açıp düzenleyebilirsiniz.


#gerekenler:

-debootstrap

-squashfs tools

-xorriso

-mtools
