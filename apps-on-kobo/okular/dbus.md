```
git checkout dbus-1.14
```
```
CHOST=arm \
CC=arm-kobo-linux-gnueabihf-gcc \
AR=arm-kobo-linux-gnueabihf-ar \
RANLIB=arm-kobo-linux-gnueabihf-ranlib \
CXX=arm-kobo-linux-gnueabihf-g++ \
LINK=arm-kobo-linux-gnueabihf-g++ \
LD=arm-kobo-linux-gnueabihf-ld \
ARCH=arm \
CROSS_COMPILE=arm-kobo-linux-gnueabihf- \
./configure --host=arm-linux-gnueabihf --prefix=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/ --disable-doxygen-docs --disable-xml-docs --disable-systemd --disable-inotify --disable-selinux --without-x --with-dbus-user=root
```
