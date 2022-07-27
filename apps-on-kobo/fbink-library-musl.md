first
```
export PATH=$PATH:/home/build/inkbox/kernel/toolchain/armv7l-linux-musleabihf-cross/bin
```

then

```
make distclean && make SHARED=1 BITMAP=1 OPENTYPE=1 CROSS_COMPILE=armv7l-linux-musleabihf- -j8 shared
```
