# Guide to install InkBox on a Kobo Nia manually, step by step
*Because tinkering with open source software is easier*

This guide could also help you port InkBox to another device.

### For errors, check [links.md](https://github.com/Szybet/kobo-nia-audio/blob/main/links.md) and the Fixes section

Here is the copy of the discord chat as of 25.02.2022

[Kobo Nia.zip](https://github.com/Szybet/kobo-nia-audio/files/8144569/The.Box.Project.-.porting.-.Kobo.Nia.zip)

# Backup the SD card
Don't brick your device.
```
dd if=/dev/mmcblk0 | xz > kobo-backup.img.xz
```

## Get the toolchain
The working toolchains are:
- https://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/arm-linux-gnueabihf/ | This toolchain is a newer version of the one that KoboLabs provides, because compiling the Nia's kernel with that one isn't possible.
- https://github.com/pgaskin/NickelTC | Creator: [@pgaskin](https://github.com/pgaskin)
- https://github.com/Kobo-InkBox/kernel/tree/master/toolchain/armv7l-linux-musleabihf-cross

Simply unpack it to `~/.local/`. Remember to delete the previous toolchain there, and make sure that in `${PATH}` the `.local` directory is first.

Adjust the parameters of make and the `CROSS_COMPILE` environment variable to your needs.

## Compiling the bootloader
Clone InkBox `kernel` repository and change directory into the Nia bootloader sources:
```
sudo mkdir -p /home/build/inkbox
sudo chown -R "${USER}:${USER}" /home/build
cd /home/build/inkbox && git clone https://github.com/Kobo-InkBox/kernel
cd kernel/bootloader/mx6ull-n306
```

To get the config, for Kobo Nia there are 2:
```
mx6ull_ntx_lpddr2_256m_defconfig
mx6ull_ntx_lpddr2_256m_mfg_defconfig
```
`mfg` means "manufacturing", so grab the normal one:
```
make -j$(($(nproc)*2)) ARCH=arm CROSS_COMPILE=arm-nickel-linux-gnueabihf- mx6ull_ntx_lpddr2_256m_defconfig
```
This will setup the sources according to the chosen configuration.
Configuring with menuconfig doesn't seem to work, so you should propably leave it as it is.
Compile with:
```
make -j$(($(nproc)*2)) ARCH=arm CROSS_COMPILE=arm-nickel-linux-gnueabihf-
```

Now, there should be two important files, `u-boot.imx` and `u-boot.bin`. For the Kobo Nia the `.imx` file is working for me. To choose how to install the bootloader look at the upgrade script in the stock Kobo firmware:
```
if [ `echo $UBOOT | grep -c imx` == 1 ]; then
        dd if=$UBOOT of=/dev/$DEVICE bs=1K seek=1
    else
        dd if=$UBOOT of=/dev/$DEVICE bs=1K seek=1 skip=1
```
So, for Nia, it is:
```
dd if=$UBOOT of=/dev/$DEVICE bs=1K seek=1
```
If something does not work, look at the image of the SD card in an hexadecimal viewer/editor, compare headers and read the `dd` man page.

## SD card
Connect the eReader to a PC with the USB cable and execute `ums 0 mmc 0` in U-Boot via a serial connection.

Launch `sudo fdisk /dev/sdcard` (of course, replace `sdcard` with your SD card's device node), clear the partition table with `o`, look up the partition with `p`, and `n` to add a partition.

**Important, set the `Start` and `End` sectors exactly like said below. InkBox OS will probably not boot otherwise.**
```
Device      Boot   Start     End Sectors  Size Id Type
/dev/nbd0p1        49152   79871   30720   15M 83 Linux
/dev/nbd0p2       104448 1128447 1024000  500M 83 Linux
/dev/nbd0p3      1128448 1390591  262144  128M 83 Linux
/dev/nbd0p4      1390592 8388607 6998016  3.3G 83 Linux
```
The last partition can be extended to the end of the SD card.

Format the four partitions with the command below:
```
mkfs.ext4 -O "^metadata_csum" /dev/sdcardp${partition}
```

Finally, write the Root kernel flag to a specific sector of the SD card, which will allow us to interface with the device via USBNet, SSH, etc. and have root access:
```
printf "rooted\n" | dd of=/dev/sdcard bs=512 seek=79872
```

## Kernel
First, follow the steps in the "Bootloader" part to set up InkBox's "kernel" repository.

**1. With the `build_kernel.sh` script in InkBox repository**

Change directory into `/home/build/inkbox/kernel`, then run:
```
env GITDIR="${PWD}"TOOLCHAINDIR="${PWD}/toolchain/arm-nickel-linux-gnueabihf/" THREADS=$(($(nproc)*2)) TARGET=arm-nickel-linux-gnueabihf scripts/build_kernel.sh n306 root
```

**2. From source**

Get the source: https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6ull-nia/kernel.tar.bz2

Grab the config from `arch/arm/configs/imx_v7_kobo_defconfig` and copy it to the main directory as `.config`

Create a symlink to your cloned repo from `/home/build/inkbox/kernel/`. The script getting busybox is static.

Enable Loopback device support, FUSE and SquashFS with XZ support.

```
console=ttymxc0,115200 rootwait rw no_console_suspend hwcfg_p=0x8ffffe00 hwcfg_sz=110 waveform_p=0x8ff71a00 waveform_sz=582529 ntxfw_p=0x8ff71400 ntxfw_sz=1034 mem=255M boot_port=1 rootfstype=ext4 root=/dev/mmcblk0p1 quiet
```
Set the `CONFIG_CMDLINE_FORCE` option to `y` and change the `CONFIG_CMDLINE` option with the contents above.

***
Write the kernel to the SD card:
```
dd if=zImage-root of=/dev/sdcard bs=512 seek=81920
```
