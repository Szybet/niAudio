# musl.
run `autogen.sh` to generate `configure` if it isin't already there

```
CHOST=arm \   
CC=armv7l-linux-musleabihf-gcc \
AR=armv7l-linux-musleabihf-ar \
RANLIB=armv7l-linux-musleabihf-ranlib \
CXX=armv7l-linux-musleabihf-g++ \
./configure --host=armv7l-linux-musleabihf --prefix=$PWD/install
```

Make sure:
- toolchain bin file is in your path ( `export PATH=$PATH:/home/build/inkbox/kernel/toolchain/armv7l-linux-musleabihf-cross/bin`
- you have permissions all toolchain files
- dont make a mistake in names ( `armv7l-linux-musleabihf-gcc` not `armv7l-linux-musleabihf-cross-gcc` )
- the *.so file is compiled for arm ( check with `file` command )
- for errors: `.libs/libevdev-uinput.o: file not recognized: file format not recognized` clean the directory, becouse previous build was for a diffrent architecture

some resources:
- https://ariya.io/2020/06/cross-compiling-with-musl-toolchains
- https://musl.openwall.narkive.com/LLfTDJsn/how-to-cross-compiling

and to add a library to cmake:
```
include_directories(${CMAKE_SOURCE_DIR}/lib)
link_directories(${CMAKE_SOURCE_DIR}/lib/libevdev/install/lib/)

add_executable(inkbox-power-deamon ${fileSrc})

target_link_libraries(inkbox-power-deamon libevdev.so.2.3.0)
```

and for arm-kobo-linux-gnueabihf
```
CHOST=arm \     
CC=arm-kobo-linux-gnueabihf-gcc \
AR=arm-kobo-linux-gnueabihf-ar \
RANLIB=arm-kobo-linux-gnueabihf-ranlib \
CXX=arm-kobo-linux-gnueabihf-g++ \
LINK=arm-kobo-linux-gnueabihf-g++ \
LD=arm-kobo-linux-gnueabihf-ld \
ARCH=arm CROSS_COMPILE=arm-kobo-linux-gnueabihf- ./configure --host=arm-linux-gnueabihf --prefix=/tmp/install
```

***
the same way / command can the `time` gnu command be compiled
