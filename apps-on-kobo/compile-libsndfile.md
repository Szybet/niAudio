```
cmake -DCMAKE_TOOLCHAIN_FILE=../kobo.cmake -D BUILD_SHARED_LIBS=ON ..
```
modified kobo.cmake:
```
# https://github.com/Szybet/kobo-nia-audio/blob/main/apps-on-kobo/kobo.cmake

# Example toolchain file for kobo
# Use with "-DCMAKE_TOOLCHAIN_FILE=../kobo.cmake" for anything that uses cmake, it should work
# https://stackoverflow.com/questions/5098360/cmake-specifying-build-toolchain
# the name of the target operating system
set(CMAKE_SYSTEM_NAME Linux)

# which compilers to use for C and C++
set(CMAKE_C_COMPILER   /home/build/inkbox/kernel/toolchain/armv7l-linux-musleabihf-cross/bin/armv7l-linux-musleabihf-gcc)
set(CMAKE_CXX_COMPILER /home/build/inkbox/kernel/toolchain/armv7l-linux-musleabihf-cross/bin/armv7l-linux-musleabihf-g++)

# where is the target environment located
set(CMAKE_FIND_ROOT_PATH /home/build/inkbox/kernel/toolchain/armv7l-linux-musleabihf-cross/)

# adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# search headers and libraries in the target environment
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY") 
# https://stackoverflow.com/questions/53633705/cmake-the-c-compiler-is-not-able-to-compile-a-simple-test-program
```
