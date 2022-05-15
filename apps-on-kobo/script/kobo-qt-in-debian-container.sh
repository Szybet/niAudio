#!/bin/bash -x
mkdir qt-kobo
cd qt-kobo

echo "koxtoolchain:"
sudo apt-get install git build-essential autoconf automake bison flex gawk libtool libtool-bin libncurses-dev curl file git gperf help2man texinfo unzip wget
git clone https://github.com/koreader/koxtoolchain
cd koxtoolchain
./gen-tc.sh kobo
sync
cd ..
sudo cp -rf ~/x-tools/ .

echo "openssl:"
wget https://www.openssl.org/source/openssl-1.1.1n.tar.gz
tar -xf openssl-1.1.1n.tar.gz
export CROSS=${PWD}/x-tools/arm-kobo-linux-gnueabihf/bin/arm-kobo-linux-gnueabihf
export SYSROOT=${PWD}/x-tools/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot
export AR=${CROSS}-ar
export AS=${CROSS}-as
export CC=${CROSS}-gcc
export CXX=${CROSS}-g++
export LD=${CROSS}-ld
export RANLIB=${CROSS}-ranlib
export CFLAGS="-O3 -march=armv7-a -mfpu=neon -mfloat-abi=hard -D__arm__ -D__ARM_NEON__ -fPIC -fno-omit-frame-pointer -funwind-tables -Wl,--no-merge-exidx-entries"
cd openssl-1.1.1n
./Configure linux-elf no-comp no-asm shared --prefix=${SYSROOT}/usr --openssldir=${SYSROOT}/usr
make -j$(nproc)
sudo make install
cd ..
sync

echo "qt:"
wget https://download.qt.io/archive/qt/5.15/5.15.2/single/qt-everywhere-src-5.15.2.tar.xz
tar -xf qt-everywhere-src-5.15.2.tar.xz
sync
cd qt-everywhere-src-5.15.2
mkdir qtbase/mkspecs/linux-kobo-gnueabihf-g++
cd qtbase/mkspecs/linux-kobo-gnueabihf-g++
curl -O https://raw.githubusercontent.com/Szybet/kobo-nia-audio/main/apps-on-kobo/script/qmake.conf
curl -O https://raw.githubusercontent.com/Szybet/kobo-nia-audio/main/apps-on-kobo/script/qplatformdefs.h
sync
cd ../../../
ls qtbase/mkspecs/linux-kobo-gnueabihf-g++
sudo apt-get install dos2unix
find . -type f -print0 | xargs -0 -n 1 -P 8 dos2unix
echo "now are qt fixes, i hope they will work"
sed -i '45i #include <limits>' qtbase/src/corelib/global/qfloat16.h
sed -i '42i #include <stdexcept>' qtbase/src/corelib/text/qbytearraymatcher.h
sed -i '42i #include <limits>' qtbase/src/corelib/text/qbytearraymatcher.h
sed -i '46i #include <limits>' qtdeclarative/src/qmldebug/qqmlprofilerevent_p.h
sed -i '/#include <limits.h>/c\#include <limits>' qtdeclarative/src/3rdparty/masm/yarr/Yarr.h

cd ..
export PATH=$PATH:${PWD}/x-tools/arm-kobo-linux-gnueabihf/bin/
export QTDIR=qt-linux-5.15.2-kobo
export SYSROOT=${PWD}/x-tools/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot
cd qt-everywhere-src-5.15.2
# This is stupid
sudo apt-get install python3 python3-pip python
./configure --recheck-all -opensource -confirm-license -release -verbose  -prefix /mnt/onboard/.adds/${QTDIR}  -extprefix /home/${USER}/qt-bin/${QTDIR}  -xplatform linux-kobo-gnueabihf-g++  -sysroot ${SYSROOT}  -openssl-linked OPENSSL_PREFIX="${SYSROOT}/usr"  -qt-libjpeg -qt-zlib -qt-libpng -qt-freetype -qt-harfbuzz -qt-pcre -sql-sqlite -linuxfb  -no-sse2 -no-xcb -no-xcb-xlib -no-tslib -no-icu -no-iconv -no-dbus  -nomake tests -nomake examples -no-compile-examples -no-opengl  -skip qtx11extras -skip qtwayland -skip qtwinextras -skip qtmacextras -skip qtandroidextras  -skip qttools -skip qtdoc -skip qtlocation -skip qtremoteobjects -skip qtconnectivity -skip qtgamepad  -skip qt3d -skip qtquick3d -skip qtquickcontrols -skip qtsensors -skip qtspeech -skip qtdatavis3d  -skip qtpurchasing -skip qtserialbus -skip qtserialport -skip multimedia -skip qtquicktimeline -skip qtlottie  -skip activeqt -skip qtscript -skip qtxmlpatterns -skip qtscxml -skip qtvirtualkeyboard  -skip qtwebengine -skip qtwebview -skip qtwebglplugin  -no-cups -no-pch -no-libproxy  -no-feature-printdialog -no-feature-printer -no-feature-printpreviewdialog -no-feature-printpreviewwidget
make -j$(nproc)
sudo make install
cd ..
sudo mv /home/qt-bin/qt-linux-5.15.2-kobo/ .
sudo rm -r /home/qt-bin/

sudo apt-get install build-essential qtcreator qt5-qmake qtbase5-dev qtbase5-dev-tools xserver-xorg-core xinit nano mesa-utils libclang-common-8-dev
