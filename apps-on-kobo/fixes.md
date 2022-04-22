https://githubhot.com/repo/ponchio/untrunc/issues/153
For anything `clock_gettime`, run export LDFLAGS=-lrt

***

Error while compiling qt program:
```
ation terminated.
make: *** [Makefile:1568: card_true_false.o] Error 1
szybet@hostname:~/sanki$ arm-kobo-linux-gnueabihf-g++ -c -pipe --sysroot=/home/nicolas/x-tools/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot -O3 -march=armv7-a -mfpu=neon -mfloat-abi=hard -D__arm__ -D__ARM_NEON__ -fPIC -fno-omit-frame-pointer -funwind-tables -Wl,--no-merge-exidx-entries -std=gnu++11 -Wall -Wextra -D_REENTRANT -fPIC -DQT_NO_DEBUG -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_SQL_LIB -DQT_CORE_LIB -I. -I/home/szybet/sanki/libraries/zip_libraries/zip/src/ -I../qt-linux-5.15.2-kobo/include -I../qt-linux-5.15.2-kobo/include/QtWidgets -I../qt-linux-5.15.2-kobo/include/QtGui -I../qt-linux-5.15.2-kobo/include/QtSql -I../qt-linux-5.15.2-kobo/include/QtCore -I. -I. -I../qt-linux-5.15.2-kobo/mkspecs/linux-kobo-gnueabihf-g++ -o card_true_false.o card_true_false.cpp
In file included from /home/szybet/x-tools/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/include/c++/11.2.0/arm-kobo-linux-gnueabihf/bits/c++config.h:586,
                 from /home/szybet/x-tools/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/include/c++/11.2.0/type_traits:38,
                 from ../qt-linux-5.15.2-kobo/include/QtCore/qglobal.h:45,
                 from ../qt-linux-5.15.2-kobo/include/QtGui/qtguiglobal.h:43,
                 from ../qt-linux-5.15.2-kobo/include/QtWidgets/qtwidgetsglobal.h:43,
                 from ../qt-linux-5.15.2-kobo/include/QtWidgets/qwidget.h:43,
                 from ../qt-linux-5.15.2-kobo/include/QtWidgets/QWidget:1,
                 from card_true_false.h:4,
                 from card_true_false.cpp:1:
/home/szybet/x-tools/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/include/c++/11.2.0/arm-kobo-linux-gnueabihf/bits/os_defines.h:39:10: fatal error: features.h: No such file or directory
   39 | #include <features.h>
      |          ^~~~~~~~~~~~
compilation terminated.
```
You need to recompile everything on your machine, especielly Qt
