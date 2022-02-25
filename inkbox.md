# Guide to install inkbox on kobo nia manually step by step
Becouse tinkering with open source software is easier
this guide could also help you port inkbox to another device, it will for sure if tux-linux explains some steps more, tagged with `*`. If not, i will try to look for diffrences from oryginal and modified inkbox sources, but that will be painfull...

the `&` letter means that the action depends of if the `*` will be cleared

### For errors, check [links.md](https://github.com/Szybet/kobo-nia-audio/blob/main/links.md) and the Fixes section

Here is the copy of the discord chat as of 25.02.2022

[The *Box Project - porting - Kobo Nia.zip](https://github.com/Szybet/kobo-nia-audio/files/8144569/The.Box.Project.-.porting.-.Kobo.Nia.zip)

# Backup the SD card
Don't brick your device.

# Get the toolchain
The working toolchains are:
- https://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/arm-linux-gnueabihf/ - it is a newer version of the one that kobolabs provides, becouse of a error
- https://github.com/pgaskin/NickelTC - creator: https://github.com/pgaskin/NickelTC

maybe try this if something fails:
- https://github.com/Kobo-InkBox/kernel/tree/master/toolchain/armv7l-linux-musleabihf-cross

Simply unpack it to `~/.local/`. Remember to delete the previous toolchain there, and be sure that in $PATH the `.local` directory is first

Adjust the parameters of make `-j 6` and `CROSS_COMPILE` to your needs

# Compiling the bootloader
get the sources from here: &
- https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6ull-nia/bootloader.tar.bz2

to get the config, look to `/configs/`, for kobo nia there are 2:
```
mx6ull_ntx_lpddr2_256m_defconfig
mx6ull_ntx_lpddr2_256m_mfg_defconfig
```
mfg means manufacturing, so grab the normal one:
```
make -j 6 CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm mx6ull_ntx_lpddr2_256m_defconfig
```
This will generate the config file.
configuring with menuconfig does that it will don't compile, so propably leave it as it is.

* Whot to modify to make it work with inkbox? propably only from where to boot the kernel

Compile with `make -j 6 CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm`, after it there should be two important files, u-boot.imx and u-boot.bin. For the kobo nia the `.imx` file is working for me. To choose how to install the bootloader look at the install skript in stock kobo:
```
if [ `echo $UBOOT | grep -c imx` == 1 ]; then
        dd if=$UBOOT of=/dev/$DEVICE bs=1K seek=1
    else
        dd if=$UBOOT of=/dev/$DEVICE bs=1K seek=1 skip=1
```
So for nia it is:
```
dd if=$UBOOT of=/dev/$DEVICE bs=1K seek=1
```
If something does not work, look at the image of the SD card in hex, compare headers and read the dd manual.

# Kernel

1. The way using inkbox repository

