# https://github.com/Szybet/kobo-nia-audio/blob/main/apps-on-kobo/kobo.cmake

# Example toolchain file for kobo
# Use with "-DCMAKE_TOOLCHAIN_FILE=../kobo.cmake" for anything that uses cmake, it should work
# https://stackoverflow.com/questions/5098360/cmake-specifying-build-toolchain
# the name of the target operating system
set(CMAKE_SYSTEM_NAME Linux)

# which compilers to use for C and C++
set(CMAKE_C_COMPILER   arm-kobo-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER arm-kobo-linux-gnueabihf-g++)

# where is the target environment located

set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")
# https://stackoverflow.com/questions/53633705/cmake-the-c-compiler-is-not-able-to-compile-a-simple-test-program

set(MYSYSROOT /home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot)
# compiler/linker flags
set( CMAKE_CXX_FLAGS " -pthread -fPIC " )
set(CMAKE_SHARED_LINKER_FLAGS "-Wl,-Bsymbolic")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --sysroot=${MYSYSROOT}" CACHE INTERNAL "" FORCE)
set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} --sysroot=${MYSYSROOT}" CACHE INTERNAL "" FORCE)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --sysroot=${MYSYSROOT}" CACHE INTERNAL "" FORCE)
set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} --sysroot=${MYSYSROOT}" CACHE INTERNAL "" FORCE)
# cmake built-in settings to use find_xxx() functions
set(CMAKE_FIND_ROOT_PATH "${MYSYSROOT}")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(Qt5Core_DIR "/home/build/inkbox/compiled-binaries/qt-bin/")
set(Qt5_DIR "/home/build/inkbox/compiled-binaries/qt-bin/")
set(QT_QMAKE_EXECUTABLE "/home/build/inkbox/compiled-binaries/qt-bin/bin/qmake")
set(QUERY_EXECUTABLE "/home/build/inkbox/compiled-binaries/qt-bin/bin/qmake")
set(QT_INSTALL_PREFIX "/home/build/inkbox/compiled-binaries/qt-bin/")
set(QT_MAJOR_VERSION "5")

set(CMAKE_CROSSCOMPILING ON CACHE INTERNAL "" FORCE)
set(DOCBOOKL10NHELPER_EXECUTABLE "/usr/bin/docbookl10nhelper") # for kdoctools - example of shitty cross compile support - copy it to KF5::docbookl10nhelper too
set(CHECKXML5_EXECUTABLE "/usr/bin/checkXML5")
set(KDOCTOOLS_MEINPROC_EXECUTABLE "/usr/bin/meinproc5") # This doesnt even fucking work - just make a symlink to this binary using this name: KF5::meinproc5

# Shouldn't be needed:
#set(PYTHON_INCLUDE_DIRS "/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/include/python3.10/")
#set(PYTHON_LIBRARY "/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/lib/libpython3.10.a")

set(WITH_X11 OFF FALSE CACHE INTERNAL "" FORCE)
set(WITH_DBUS OFF)
set(WITH_WAYLAND OFF)

set(BUILD_QCH OFF CACHE INTERNAL "" FORCE)
set(KF5DocTools_FOUND OFF CACHE INTERNAL "" FORCE)
set(CMAKE_DISABLE_FIND_PACKAGE_KF5DocTools ON CACHE INTERNAL "" FORCE) # Fuck this package

set(HAVE_X11 FALSE CACHE INTERNAL "" FORCE) # Standrdssddsds
set(BUILD_TESTING OFF CACHE INTERNAL "" FORCE)
set(CMAKE_DISABLE_FIND_PACKAGE_Qt5X11Extras ON CACHE INTERNAL "" FORCE)
set(HAVE_DBUS OFF CACHE INTERNAL "" FORCE)

# set(Canberra_FOUND ON CACHE INTERNAL "" FORCE) # Doesnt work, just build phonon https://invent.kde.org/libraries/phonon

set(Qt5Designer_FOUND OFF CACHE INTERNAL "" FORCE)
set(PHONON_BUILD_DOC OFF CACHE INTERNAL "" FORCE)
set(PHONON_BUILD_SETTINGS OFF CACHE INTERNAL "" FORCE)
set(PHONON_BUILD_DEMOS OFF CACHE INTERNAL "" FORCE)
set(PHONON_BUILD_DESIGNER_PLUGIN OFF CACHE INTERNAL "" FORCE)

set(CMAKE_DISABLE_FIND_PACKAGE_Qt5TextToSpeech ON CACHE INTERNAL "" FORCE) # Fuck this package

# qca
set(BUILD_TESTS OFF CACHE INTERNAL "" FORCE)
set(BUILD_TOOLS OFF CACHE INTERNAL "" FORCE)
set(BUILD_PLUGINS "none")

# kwallet
set(BUILD_KWALLETD OFF CACHE INTERNAL "" FORCE)
set(BUILD_KWALLET_QUERY OFF CACHE INTERNAL "" FORCE)

# solid
#set(UDEV_DISABLED ON CACHE INTERNAL "" FORCE)
#set(HAVE_LIBMOUNT ON CACHE INTERNAL "" FORCE)
#set(UDEV_FOUND ON CACHE INTERNAL "" FORCE)
#set(CMAKE_DISABLE_FIND_PACKAGE_IMobileDevice ON CACHE INTERNAL "" FORCE) # Fuck this package
#set(CMAKE_DISABLE_FIND_PACKAGE_PList ON CACHE INTERNAL "" FORCE) # Fuck this package
#set(CMAKE_DISABLE_FIND_PACKAGE_LibMount ON CACHE INTERNAL "" FORCE) # Fuck this package
# also add --enable-libmount to util-linux and recompile it
set(HAVE_GETMNTINFO OFF CACHE INTERNAL "" FORCE) # Important, i'm not on bsd

# kio
#set(KIOCORE_ONLY ON CACHE INTERNAL "" FORCE)
set(BUILD_DESIGNERPLUGIN OFF CACHE INTERNAL "" FORCE)
set(HAVE_COPY_FILE_RANGE OFF CACHE INTERNAL "" FORCE) # Important, i'm not on bsd

# kinit
set(HAVE_SETPROCTITLE OFF CACHE INTERNAL "" FORCE)

# kjs
set(KJS_FORCE_DISABLE_PCRE ON CACHE INTERNAL "" FORCE)
set(ICEMAKER_EXECUTABLE "/usr/bin/icemaker")

# kactivities
set(KACTIVITIES_LIBRARY_ONLY ON CACHE INTERNAL "" FORCE)

# kpty
# set(CMAKE_DISABLE_FIND_PACKAGE_UTEMPTER ON CACHE INTERNAL "" FORCE)
set(UTEMPTER_EXECUTABLE "/usr/lib/utempter/utempter" CACHE INTERNAL "" FORCE)
set(HAVE_OPENPTY OFF CACHE INTERNAL "" FORCE)
set(HAVE_LOGIN OFF CACHE INTERNAL "" FORCE)
set(HAVE_PTY_H ON CACHE INTERNAL "" FORCE)

# okular
set(FORCE_NOT_REQUIRED_DEPENDENCIES "KF5Wallet;KF5DocTools;KF5JS;TIFF;JPEG;LibSpectre;KF5KExiv2;CHM;KF5KHtml;LibZip;DjVuLibre;EPub;Discount;discount;Freetype" CACHE INTERNAL "" FORCE)
set(QT_NO_CAST_FROM_ASCII OFF CACHE INTERNAL "" FORCE)
set(CMAKE_DISABLE_FIND_PACKAGE_Discount ON CACHE INTERNAL "" FORCE) # Fuck this package
set(CMAKE_DISABLE_FIND_PACKAGE_discount ON CACHE INTERNAL "" FORCE) # Fuck this package
#set(CMAKE_DISABLE_FIND_PACKAGE_Freetype ON CACHE INTERNAL "" FORCE) # Testing

# maybe
# set(OKULAR_TEXTDOCUMENT_THREADED_RENDERING OFF CACHE INTERNAL "" FORCE)

# Useless
#set(DEBUG_TEXTPAGE ON CACHE INTERNAL "" FORCE)
#set(WITH_KJS OFF CACHE INTERNAL "" FORCE)
#set(DEBUG_FONT ON CACHE INTERNAL "" FORCE)
#set(PERFORMANCE_MEASUREMENT ON CACHE INTERNAL "" FORCE)
#set(TXT_DEBUG ON CACHE INTERNAL "" FORCE)
#set(PAGEVIEW_DEBUG ON CACHE INTERNAL "" FORCE)

set(OKULAR_KEEP_FILE_OPEN OFF CACHE INTERNAL "" FORCE)
set(WITH_KWALLET OFF CACHE INTERNAL "" FORCE)
set(WITH_KACTIVITIES OFF CACHE INTERNAL "" FORCE)

set(CMAKE_DISABLE_FIND_PACKAGE_KF5Wallet ON CACHE INTERNAL "" FORCE) # Fuck this package
set(CMAKE_DISABLE_FIND_PACKAGE_KWallet ON CACHE INTERNAL "" FORCE) # Fuck this package

set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build (Debug or Release)" FORCE)

# libzip
set(HAVE_CLONEFILE OFF CACHE INTERNAL "" FORCE)
set(HAVE_ARC4RANDOM OFF CACHE INTERNAL "" FORCE)

#pdf Poppler
set(HAVE_FSEEK64 OFF CACHE INTERNAL "" FORCE)
set(ENABLE_QT6 OFF CACHE INTERNAL "" FORCE)
set(ENABLE_BOOST OFF CACHE INTERNAL "" FORCE) # set manually in cmakelist too
set(USE_BOOST_HEADERS OFF CACHE INTERNAL "" FORCE)
set(ENABLE_NSS3 OFF CACHE INTERNAL "" FORCE)
set(ENABLE_LIBOPENJPEG "none" CACHE INTERNAL "" FORCE)


