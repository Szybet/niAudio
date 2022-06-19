### to make clangd work for `armv7l-linux-musleabihf-cross`

in `/home/build/inkbox/kernel/toolchain/armv7l-linux-musleabihf-cross/armv7l-linux-musleabihf/include/c++/10.2.1` do `cp -r armv7l-linux-musleabihf/bits/* bits`

also launch vscode with: `CPLUS_INCLUDE_PATH=/home/build/inkbox/kernel/toolchain/armv7l-linux-musleabihf-cross/armv7l-linux-musleabihf/include/c++/10.2.1 code`
