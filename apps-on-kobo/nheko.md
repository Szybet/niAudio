Maybe

# Overall things:
- `make DESTDIR=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot install`
- `bash -c "rm -rf *"; cmake -DCMAKE_TOOLCHAIN_FILE=../../kobo.cmake ..; make -j 8 -s >/dev/null`

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

```
git clone https://github.com/nlohmann/json.git
```
easy


# Libevent

```
git clone https://github.com/libevent/libevent.git
```
easy

# Abseil
```
git clone https://github.com/abseil/abseil-cpp.git
```
easy too

# Re2

```
git clone https://github.com/google/re2.git
````
wow still easy

# lmdbxx
```
git clone https://github.com/hoytech/lmdbxx.git
```
just as in lmdb

wooo easy too

# Nheko
Lies.
```
git checkout v0.11.0
```
Oh fuck opengl

```
In file included from /usr/include/qt/QtQuick/qsggeometry.h:44,
                 from /usr/include/qt/QtQuick/qsgnode.h:43,
                 from /usr/include/qt/QtQuick/qsgrendererinterface.h:43,
                 from /usr/include/qt/QtQuick/qquickwindow.h:44,
                 from /usr/include/qt/QtQuick/qquickview.h:43,
                 from /usr/include/qt/QtQuick/QQuickView:1,
                 from /home/build/inkbox/nheko-crosscompilation-hell/nheko/build/nheko_autogen/UVLADIE3JM/../../../src/MainWindow.h:13,
                 from /home/build/inkbox/nheko-crosscompilation-hell/nheko/build/nheko_autogen/UVLADIE3JM/moc_MainWindow.cpp:10,
                 from /home/build/inkbox/nheko-crosscompilation-hell/nheko/build/nheko_autogen/mocs_compilation.cpp:15:
/usr/include/qt/QtGui/qopengl.h:141:13: fatal error: GL/gl.h: No such file or directory
  141 | #   include <GL/gl.h>
```
fuck fuck fuck

fuck
https://github.com/qt/qtdeclarative-render2d
https://doc.qt.io/QtQuick2DRenderer/qtquick2drenderer-installation-guide.html#how-to-use-the-opengl-dummy-libraries

yea thats it, gg, no way to do that
