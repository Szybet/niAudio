```
HOST=arm \                                                                                                         
CC=arm-kobo-linux-gnueabihf-gcc \
AR=arm-kobo-linux-gnueabihf-ar \
RANLIB=arm-kobo-linux-gnueabihf-ranlib \
CXX=arm-kobo-linux-gnueabihf-g++ \
LINK=arm-kobo-linux-gnueabihf-g++ \
LD=arm-kobo-linux-gnueabihf-ld \
ARCH=arm CROSS_COMPILE=arm-kobo-linux-gnueabihf- \
make -j 8
```
```
make DESTDIR=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot install
```
If
```
/mnt/HDD/Project/inkbox-build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/bin/../lib/gcc/arm-kobo-linux-gnueabihf/11.2.0/../../../../arm-kobo-linux-gnueabihf/bin/ld.bfd: obj/conf_9715080c18a0be2a0745da11904073f1/timefn.o: undefined reference to symbol 'clock_gettime@@GLIBC_2.4'
```
then
```
git checkout tags/v1.4.0
```
