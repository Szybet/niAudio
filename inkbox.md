# Guide to install inkbox on kobo nia manually step by step
Becouse tinkering with open source software is easier

this guide could also help you port inkbox to another device, it will for sure if tux-linux explains some steps more, tagged with `*`. If not, i will try to look for diffrences from oryginal and modified inkbox sources, but that will be painfull...
- the line (`***`) after points 2 etc. mean that they connect all the points, the same steps for both of them
- the & mark says it will propably change in the future

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
1. From source
get the sources from here:
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

* Whot to modify to make it work with inkbox? propably only from where to boot the kernel:
```
change kernel sector to 81920 and load size to 18432  in ntx_comm.c
```


2. From inkbox repo

clone the repo: https://github.com/Kobo-InkBox/kernel

cd into bootloader and then to the bootloader sources

***

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

# SD card
connect the ereader to PC, execute `ums 0 mmc 0` in u-boot

launch `sudo fdisk /dev/thesdcard`, clear the partition table with `o`, look up the partition with `p`, and `n` to add a partition.

### Important, set the start, end sector like said below. Its important, inkbox works like that
```
Device      Boot   Start     End Sectors  Size Id Type
/dev/nbd0p1        49152   79871   30720   15M 83 Linux
/dev/nbd0p2       104448 1128447 1024000  500M 83 Linux
/dev/nbd0p3      1128448 1390591  262144  128M 83 Linux
/dev/nbd0p4      1390592 8388607 6998016  3.3G 83 Linux
```
The last partition can be extended to the end of the sd card

format the partitions using ```mkfs.ext4 -O "^metadata_csum" /dev/partition```. * can we format them now, all at once or does it need to be after specific steps?

# Kernel
1. The way using inkbox repository
copy the inkbox repo:
- https://github.com/Kobo-InkBox/kernel

enter the directory, execute:
```
env GITDIR=$PWD TOOLCHAINDIR=$PWD/toolchain/arm-nickel-linux-gnueabihf/ THREADS=6 TARGET=arm-nickel-linux-gnueabihf scripts/build_kernel.sh n306 root
```

2. From source

Get the source: https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6ull-nia/kernel.tar.bz2

Grab the config from `arch/arm/configs/imx_v7_kobo_defconfig` and copy it to the main directory as `.config`

& Create a symlink to your cloned repo from `/home/build/inkbox/kernel/`. The script getting busybox is static

* whot to modify to make it work for the nia? this is the most important step, this will show whot inkbox needs and will be helpfull for porting to other devices. the things i know:
```
oopback device support, FUSE, squashFS and other things

console=ttymxc0,115200 rootwait rw no_console_suspend hwcfg_p=0x8ffffe00 hwcfg_sz=110 waveform_p=0x8ff71a00 waveform_sz=582529 ntxfw_p=0x8ff71400 ntxfw_sz=1034 mem=255M boot_port=1 rootfstype=ext4 root=/dev/mmcblk0p1 quiet
Args passed to the kernel at boot
```

Change DEFAULT_LOAD_KERNEL_SZ in `bootloader/mx6ull-n306/board/freescale/mx6ull_ntx/ntx_comm.c` to 20480 \*& this is propably fixed now?

***
Write the kernel:
```
dd if=zImage-root of=/dev/partition bs=512 seek=2048
```
