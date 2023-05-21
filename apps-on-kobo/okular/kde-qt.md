including libinput, for kde apps support
```
./configure --recheck-all -opensource -confirm-license -release -verbose \
 -prefix /mnt/onboard/.adds/${QTDIR} \
 -extprefix /home/build/inkbox/compiled-binaries/qt-bin/${QTDIR} \
 -xplatform linux-kobo-gnueabihf-g++ \
 -sysroot ${SYSROOT} \
 -openssl-linked OPENSSL_PREFIX="${SYSROOT}/usr" \
 -qt-libjpeg -qt-zlib -qt-libpng -qt-freetype -qt-harfbuzz -qt-pcre -sql-sqlite -linuxfb \
 -no-sse2 -no-xcb -no-xcb-xlib -no-tslib -no-icu -no-iconv \
 -nomake tests -nomake examples -no-compile-examples -no-opengl \
 -skip qtx11extras -skip qtwayland -skip qtwinextras -skip qtmacextras -skip qtandroidextras \
 -skip qttools -skip qtdoc -skip qtlocation -skip qtremoteobjects -skip qtconnectivity -skip qtgamepad \
 -skip qt3d -skip qtquick3d -skip qtquickcontrols -skip qtsensors -skip qtspeech -skip qtdatavis3d \
 -skip qtpurchasing -skip qtserialbus -skip qtserialport -skip multimedia -skip qtquicktimeline -skip qtlottie \
 -skip activeqt -skip qtscript \
 -skip qtwebengine -skip qtwebview -skip qtwebglplugin \
 -no-cups -no-pch -no-libproxy \
 -libudev -evdev -libinput -xkbcommon \
 -dbus-runtime
 ```
