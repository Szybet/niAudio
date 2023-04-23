## Guide for bare libinput support in Qt5
run:
```
export PATH=$PATH:/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/bin/
```

### kmod
```
git clone https://github.com/lucasdemarchi/kmod
```
run autogen, then
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
well and
```
make -j 8
sudo make install
```

### blkid - util-linux
get an older version
```
wget https://cdn.kernel.org/pub/linux/utils/util-linux/v2.36/util-linux-2.36-rc1.tar.gz
```
well you know, then
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
./configure --host=arm-linux-gnueabihf --prefix=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/ --disable-all-programs --enable-libblkid --enable-blkid
```

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
./configure --host=arm-linux-gnueabihf --prefix=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/ -disable-selinux --disable-manpages
```
edit `src/udev/udev-builtin-input_id.c` and add
```
#define INPUT_PROP_DIRECT              0x01    /* direct input devices */
#define ABS_MT_SLOT            0x2f    /* MT slot being modified */
#define BTN_TRIGGER_HAPPY1             0x2c0
#define BTN_TRIGGER_HAPPY40            0x2e7
```
this is fetched from other files, libraries: mtdev, libwacom. linux/input-event-codes.h

in `src/v4l_id/v4l_id.c` remove those all lines in main and add a `return -1`, maybe a message saying this file is cursed too.

idk why, but this is needed:
```
C_INCLUDE_PATH=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/include/ make -j 8
```

### mtdev
```
git clone https://github.com/rydberg/mtdev
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

## libevdev 
```
git clone https://gitlab.freedesktop.org/libevdev/libevdev
```
the command for configure is the same as in mtdev, the regular one


### Libinput
```
git clone https://gitlab.freedesktop.org/libinput/libinput/
```

in meson options for libinput set
- libwacom to false
- tests to false
- debug-gui to false

then run:
```
DESTDIR=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot meson setup --cross-file ../meson-kobo.txt build
```
```
cd build
ninja
```
```
meson install --destdir /home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot
```

Now for Qt, additionally we need: 
### libxkbcommon
```
git clone https://github.com/xkbcommon/libxkbcommon
```
in meson option:
- enable-x11 to false
- enable-docs to false
- enable-wayland to false

the rest is as in libinput with meson

### Changes for Qt:
```
export SYSROOT=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/
```
```
./configure --recheck-all -opensource -confirm-license -release -verbose \
 -prefix /mnt/onboard/.adds/${QTDIR} \
 -extprefix /home/build/inkbox/compiled-binaries/qt-bin/${QTDIR} \
 -xplatform linux-kobo-gnueabihf-g++ \
 -sysroot ${SYSROOT} \
 -openssl-linked OPENSSL_PREFIX="${SYSROOT}/usr" \
 -qt-libjpeg -qt-zlib -qt-libpng -qt-freetype -qt-harfbuzz -qt-pcre -sql-sqlite -linuxfb \
 -no-sse2 -no-xcb -no-xcb-xlib -no-tslib -no-icu -no-iconv -no-dbus \
 -nomake tests -nomake examples -no-compile-examples -no-opengl \
 -skip qtx11extras -skip qtwayland -skip qtwinextras -skip qtmacextras -skip qtandroidextras \
 -skip qttools -skip qtdoc -skip qtlocation -skip qtremoteobjects -skip qtconnectivity -skip qtgamepad \
 -skip qt3d -skip qtquick3d -skip qtquickcontrols -skip qtsensors -skip qtspeech -skip qtdatavis3d \
 -skip qtpurchasing -skip qtserialbus -skip qtserialport -skip multimedia -skip qtquicktimeline -skip qtlottie \
 -skip activeqt -skip qtscript -skip qtxmlpatterns -skip qtscxml -skip qtvirtualkeyboard \
 -skip qtwebengine -skip qtwebview -skip qtwebglplugin \
 -no-cups -no-pch -no-libproxy \
 -no-feature-printdialog -no-feature-printer -no-feature-printpreviewdialog -no-feature-printpreviewwidget \
 -libudev -evdev -libinput -xkbcommon
```
look out for errors with xkbcommon, if it all passed then good. i needed to do:
```
cd /home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/
cp -r usr/local/lib/pkgconfig/* usr/lib/pkgconfig
cp -r lib/pkgconfig/* usr/lib/pkgconfig
sudo cp ./include/libudev.h usr/include
```
***
to debug apps:
```
QT_DEBUG_PLUGINS=1 QT_LOGGING_RULES=qt.qpa.input=true
```
to ignore devices:
```
ACTION=="add|change", SUBSYSTEM=="input", KERNEL=="event[0-1]*", ATTR{enabled}="0", ATTR{authorized}="0", ENV{LIBINPUT_IGNORE_DEVICE}="1"
```
to set a custom keymap:
```
XKB_DEFAULT_LAYOUT=us
```
