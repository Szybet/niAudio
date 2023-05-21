idk when:
https://www.linuxfromscratch.org/blfs/view/systemd/general/duktape.html


https://github.com/GNOME/glib

glib goes normally, then

then

https://github.com/libexpat/libexpat

then

https://github.com/linux-pam/linux-pam/tree/v1.1.6

change to this tag, no additional configure arguments

if pc files arent generated, use these:
`pam_misc.pc`
```
prefix=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot
exec_prefix=${prefix}
libdir=/lib
includedir=/include

Name: pam_misc
Description: Miscellaneous functions that make the job of writing PAM-aware applications easier.
URL: http://www.linux-pam.org/
Version: 1.5.3
Cflags: -I${includedir}
Libs: -L${libdir} -lpam_misc
```
`pamc.pc`
```
prefix=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot
exec_prefix=${prefix}
libdir=/lib
includedir=/include

Name: libpamc
URL: http://www.linux-pam.org/
Description: The PAM client API library and binary prompt support. Rarely used.
Version: 1.5.3
Cflags: -I${includedir}
Libs: -L${libdir} -lpamc
```
`pam.pc`
```
prefix=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot
exec_prefix=${prefix}
libdir=/lib
includedir=/include

Name: PAM
Description: The primary Linux-PAM library. It is used by PAM modules and PAM-aware applications.
URL: http://www.linux-pam.org/
Version: 1.5.3
Cflags: -I${includedir}
Libs: -L${libdir} -lpam
```

and
https://github.com/linux-pam/linux-pam/issues/406

and in `./arm-kobo-linux-gnueabihf/sysroot/usr/include/linux/quota.h` comment out the line:
```
./arm-kobo-linux-gnueabihf/sysroot/usr/include/linux/quota.h
```

and 

https://github.com/alisw/libtirpc.git

something went wrong:
```
cp -r ./arm-kobo-linux-gnueabihf/sysroot/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot/* arm-kobo-linux-gnueabihf/sysroot
```
meson options for polkit:
```
option('session_tracking', type: 'combo', choices: ['libsystemd-login', 'libelogind', 'ConsoleKit'], value: 'ConsoleKit', description: 'session tracking (libsystemd-login/libelogind/ConsoleKit)')
option('systemdsystemunitdir', type: 'string', value: '', description: 'custom directory for systemd system units')

option('libs-only', type: 'boolean', value: false, description: 'Only build libraries (skips building polkitd)')
option('polkitd_user', type: 'string', value: 'polkitd', description: 'User for running polkitd (polkitd)')

option('authfw', type: 'combo', choices: ['pam', 'shadow', 'bsdauth'], value: 'pam', description: 'Authentication framework (pam/shadow)')
option('os_type', type: 'combo', choices: ['redhat', 'suse', 'gentoo', 'pardus', 'solaris', 'netbsd', 'lfs', ''], value: '', description: 'distribution or OS')

option('pam_include', type: 'string', value: '', description: 'pam file to include')
option('pam_module_dir', type: 'string', value: '', description: 'directory to install PAM security module')
option('pam_prefix', type: 'string', value: '', description: 'specify where pam files go')

option('examples', type: 'boolean', value: false, description: 'Build example programs')
option('tests', type: 'boolean', value: false, description: 'Build tests')
option('introspection', type: 'boolean', value: false, description: 'Enable introspection for this build')

option('gtk_doc', type: 'boolean', value: false, description: 'use gtk-doc to build documentation')
option('man', type: 'boolean', value: false, description: 'build manual pages')
option('js_engine', type: 'combo', choices: ['mozjs', 'duktape'], value: 'duktape', description: 'javascript engine')
```

to build polkit:
`DESTDIR=/home/build/inkbox/compiled-binaries/arm-kobo-linux-gnueabihf/arm-kobo-linux-gnueabihf/sysroot CFLAGS=-lrt  meson setup --cross-file ../meson-kobo.txt build`

