https://stackoverflow.com/questions/53885273/cross-compile-zlib-for-arm
```shell
CHOST=arm \   
CC=arm-kobo-linux-gnueabihf-gcc \
AR=arm-kobo-linux-gnueabihf-ar \
RANLIB=arm-kobo-linux-gnueabihf-ranlib \
./configure \
--prefix=build_lib
```
```
make
make install
```

Now copy the files to x-tools toolchain dir
