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

set(MYSYSROOT /home/build/inkbox/kernel/toolchain/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/)
# compiler/linker flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --sysroot=${MYSYSROOT}" CACHE INTERNAL "" FORCE)
set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} --sysroot=${MYSYSROOT}" CACHE INTERNAL "" FORCE)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --sysroot=${MYSYSROOT}" CACHE INTERNAL "" FORCE)
set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} --sysroot=${MYSYSROOT}" CACHE INTERNAL "" FORCE)
# cmake built-in settings to use find_xxx() functions
set(CMAKE_FIND_ROOT_PATH "${MYSYSROOT}")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
