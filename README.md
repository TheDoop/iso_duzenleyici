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

4- squashfs oluşturucu
Bu program lb build aracısığı ile squashfs oluşturmaya yarar. Bu squashfs 
dosyasını live isoya ekleyebilirsiniz. isterseniz de iso çıkarıcı ile 
açıp düzenleyebilirsiniz.


#gerekenler:

-live build

-squashfs tools

-xorriso

-mtools