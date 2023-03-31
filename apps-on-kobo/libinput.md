## Guide for bare libinput support in Qt5

### Libudev - eudev
```
git clone https://github.com/eudev-project/eudev
```
run
```
./autogen.sh
```
then
```
CHOST=arm CC=arm-kobo-linux-gnueabihf-gcc \
AR=arm-kobo-linux-gnueabihf-ar \
RANLIB=arm-kobo-linux-gnueabihf-ranlib \
CXX=arm-kobo-linux-gnueabihf-g++ \
LINK=arm-kobo-linux-gnueabihf-g++ \
LD=arm-kobo-linux-gnueabihf-ld \
ARCH=arm CROSS_COMPILE=arm-kobo-linux-gnueabihf- \
./configure --host=arm-linux-gnueabihf --prefix=/mnt/HDD/Project/qt-test/eudev/buildroot -disable-selinux --disable-manpages
```
edit `src/udev/udev-builtin-input_id.c` and add
```
#define INPUT_PROP_DIRECT              0x01    /* direct input devices */
#define ABS_MT_SLOT            0x2f    /* MT slot being modified */
#define BTN_TRIGGER_HAPPY1             0x2c0
#define BTN_TRIGGER_HAPPY40            0x2e7
```
this is fetched from other files, libraries: mtdev, libwacom. linux/input-event-codes.h


run:
```
export PATH=$PATH:/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/bin/
```

### Libinput
```
git clone https://gitlab.freedesktop.org/libinput/libinput/
```

in meson options for libinput set
- libwacom to false
- tests to false

then run:
```
DESTDIR=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot meson setup --cross-file ../meson-kobo.txt buil
```
