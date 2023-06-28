Maybe

# Overall things:
- `make DESTDIR=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot install`
- `bash -c "rm -rf *"; cmake -DCMAKE_TOOLCHAIN_FILE=../../kobo.cmake ..; make -j 8`

# spdlog

```
git clone https://github.com/gabime/spdlog.git
```
easy

# lmdb

```
git clone https://github.com/clibs/lmdb.git
git checkout release/0.9.5
CHOST=arm CC=arm-kobo-linux-gnueabihf-gcc \
AR=arm-kobo-linux-gnueabihf-ar \
RANLIB=arm-kobo-linux-gnueabihf-ranlib \
CXX=arm-kobo-linux-gnueabihf-g++ \
LINK=arm-kobo-linux-gnueabihf-g++ \
LD=arm-kobo-linux-gnueabihf-ld \
ARCH=arm CROSS_COMPILE=arm-kobo-linux-gnueabihf- make -j 8
mkdir -p /home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/usr/local/man/
```

# Nlohman json

````
git clone https://github.com/nlohmann/json.git
```
easy

# Nheko
Lies.
```
git checkout v0.11.0
```
