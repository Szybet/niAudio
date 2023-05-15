the fuck those versions

download this https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.47.tar.bz2

for whatever reason copy this manually:
```
cp ./src/gpg-error.pc /home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/usr/lib/pkgconfig
cp ./src/gpg-error.pc.in /home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/usr/lib/pkgconfig 
```
then this: `git clone https://github.com/gpg/libgcrypt`

this configure:
```
CHOST=arm \   
CC=arm-kobo-linux-gnueabihf-gcc \
AR=arm-kobo-linux-gnueabihf-ar \
RANLIB=arm-kobo-linux-gnueabihf-ranlib \
./configure \
--prefix=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot --host=arm-linux-gnueabihf --disable-doc
```

then for libxslt
```
git checkout tags/v1.1.31
```

```
CHOST=arm CC=arm-kobo-linux-gnueabihf-gcc \
AR=arm-kobo-linux-gnueabihf-ar \
RANLIB=arm-kobo-linux-gnueabihf-ranlib \
CXX=arm-kobo-linux-gnueabihf-g++ \
LINK=arm-kobo-linux-gnueabihf-g++ \
LD=arm-kobo-linux-gnueabihf-ld \
ARCH=arm CROSS_COMPILE=arm-kobo-linux-gnueabihf- \
./configure --host=arm-linux-gnueabihf --prefix=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/
```

why?
```
cp ./arm-kobo-linux-gnueabihf/sysroot/include/* arm-kobo-linux-gnueabihf/sysroot/usr/include/
```
