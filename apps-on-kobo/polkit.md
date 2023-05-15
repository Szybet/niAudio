https://github.com/GNOME/glib

glib goes normally, then

then

https://github.com/libexpat/libexpat

then

https://github.com/linux-pam/linux-pam/tree/v1.1.6

change to this tag, no additional configure arguments

pc files arent generated, use these:
`pam_misc.pc`
```
prefix=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot
exec_prefix=${prefix}
libdir=/lib
includedir=/include

Name: pam_misc
Description: Miscellaneous functions that make the job of writing PAM-aware applications easier.
URL: http://www.linux-pam.org/
Version: 1.5.3
Cflags: -I${includedir}
Libs: -L${libdir} -lpam_misc
```
`pamc.pc`
```
prefix=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot
exec_prefix=${prefix}
libdir=/lib
includedir=/include

Name: libpamc
URL: http://www.linux-pam.org/
Description: The PAM client API library and binary prompt support. Rarely used.
Version: 1.5.3
Cflags: -I${includedir}
Libs: -L${libdir} -lpamc
```
`pam.pc`
```
prefix=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot
exec_prefix=${prefix}
libdir=/lib
includedir=/include

Name: PAM
Description: The primary Linux-PAM library. It is used by PAM modules and PAM-aware applications.
URL: http://www.linux-pam.org/
Version: 1.5.3
Cflags: -I${includedir}
Libs: -L${libdir} -lpam
```

and
https://github.com/linux-pam/linux-pam/issues/406

and in `./arm-kobo-linux-gnueabihf/sysroot/usr/include/linux/quota.h` comment out the line:
```
./arm-kobo-linux-gnueabihf/sysroot/usr/include/linux/quota.h
```

