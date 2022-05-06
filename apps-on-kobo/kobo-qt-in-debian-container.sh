#!/bin/bash
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



