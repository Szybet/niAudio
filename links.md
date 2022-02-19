# Links that are useful / helped me to achieve next steps in my project
## Sound card hardware:
https://www.instructables.com/USB-Sound-Card/ - example sound card

Texas Instrument PCM2912A, **PCM2704** IC

## Kobo hardware:
http://gethighstayhigh.co.uk/kobo-self-build/ - modding kobo for xcsoar

## Kobo Software:
https://www.linux-magazine.com/Online/Features/Basic-Hacks-for-Kobo-E-Readers - guide for beginning with kobo

https://www.mobileread.com/forums/showthread.php?t=295612 - list of kobo hacks

https://wordpress.panaceas.org/wp/index.php/2015/12/28/kobo-glo-sic-hd-hacking-part-1/ - hacking kobo + partition table + debian

https://github.com/marek-g/kobo-kernel-2.6.35.3-marek - kernel for xorg

https://github.com/kobolabs/Kobo-Reader/ - Kobo software source, oryginal kernel is from here

https://github.com/kobolabs/Kobo-Reader/blob/master/documentation/README.kernel - how to compile kernel on kobo

https://wiki.postmarketos.org/wiki/Kobo_Clara_HD_(kobo-clara) - postmarketos on kobo

https://github.com/olup/kobowriter - keyboard + kobo so implements otg

https://github.com/Kobo-InkBox/kernel - custom kernels for kobo, seems interesting

https://pgaskin.net/KoboStuff/kobofirmware.html - kobo firmware copies

## Fixes:
https://forum.openwrt.org/t/build-error-gcc-10-x-solved-pls-fix-on-repo/68942 - the oryginal kernel wasn't compiling, this was needed. this toolchain also works: https://github.com/pgaskin/NickelTC, download it is here under nickel name: https://github.com/Kobo-InkBox/kernel/tree/master/toolchain/arm-nickel-linux-gnueabihf

https://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/arm-linux-gnueabihf/ - oryginal toolchain wasn't working becouse of "this compiler is known to cause problems", so this is the source for a newer one

#### https://www.mobileread.com/forums/showthread.php?t=340418 - How to switch OTG mode to host on kobo

https://unix.stackexchange.com/questions/60078/find-out-which-modules-are-associated-with-a-usb-device - read usb devices without usbutils

https://github.com/openbmc/openbmc/issues/3274 - bootloader compiler errors, the package on arch linux is dtc

https://stackoverflow.com/questions/53058002/imx6-get-u-boot-to-temporarily-boot-another-u-boot - u-boot without installing, it doesn't work but the beginning works, good for beginning to start with it


### looking for help:
https://github.com/kobolabs/Kobo-Reader/issues/116

https://www.mobileread.com

https://github.com/Kobo-InkBox/kernel/issues/1 - maybe will help?
