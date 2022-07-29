first
```
export PATH=$PATH:/home/build/inkbox/kernel/toolchain/armv7l-linux-musleabihf-cross/bin
```

then

```
make distclean && make -j8 shared MINIMAL=1 BITMAP=1 OPENTYPE=1
```
