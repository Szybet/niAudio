## Notes for kobo nia, code name n306
### Usb controler:
The usb controler is ChipIdea Highspeed Dual Role Controller Driver, the module is ci_hdrc
```
<*>   ChipIdea Highspeed Dual Role Controller
  [*]     ChipIdea device controller
  [*]     ChipIdea host controller
```
`/sys/kernel/debug/usb/devices` says:
```
T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=480  MxCh= 1
B:  Alloc=  0/800 us ( 0%), #Int=  0, #Iso=  0
D:  Ver= 2.00 Cls=09(hub  ) Sub=00 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1d6b ProdID=0002 Rev= 4.01
S:  Manufacturer=Linux 4.1.15idontknow ehci_hcd
S:  Product=EHCI Host Controller
S:  SerialNumber=ci_hdrc.0
C:* #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=  0mA
I:* If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
E:  Ad=81(I) Atr=03(Int.) MxPS=   4 Ivl=256ms
```

Some links:
- https://elixir.bootlin.com/linux/v4.15/source/Documentation/usb/chipidea.txt - some debugging?
- https://www.spinics.net/lists/linux-usb/msg177458.html - errors


### ntx_hwconfig
linux sys call command

from xcsoar issue: "ntx_hwconfig is a tool used to read blob values from linux userspace."

It reads / writes data to the sd card
```
0x80000-0xbffff	1024-1535	hwconfig (read by ntx_hwconfig)
```
there is something about usb, and audio:
```
[63] PCB_Flags2=eMMC@SD1:OFF,WiFi@SD2:OFF,eMMC@SD2:OFF,USB_TYPEC:OFF,(null):OFF,(null):OFF,(null):OFF,(null):OFF
```
```
[2] AudioCodec='No' [ No|ALC5623|ALC5640|NC|RTL8821CS|RTL8822BS|ALC5645 ]
[3] AudioAmp='No' [ No|TPA2016|NC ]
```

The CPU model on the kobo is:
```
27] CPU='mx6ull' [ mx35|m166e|mx50|x86|mx6|mx6sl|it8951|i386|mx7d|mx6ull|mx6sll|mx6dl|rk3368|rk3288|b300 ]
```
And u-boot at boot outputs:
```
CPU:   Freescale i.MX6ULL rev1.1 at 396MHz

CPU:   Commercial temperature grade (0C to 95C) at 37C

Reset cause: POR

Board: MX6ULL NTX
```

Some links:
- https://www.mobileread.com/forums/showthread.php?t=316455
- https://github.com/pazos/linux-2.6.35.3-kobo/blob/master/arch/arm/mach-mx5/ntx_hwconfig.c
- **https://github.com/XCSoar/XCSoar/pull/634**

### u-boot

#### So the script to update u-boot is:
```
dd if=$UBOOT of=/dev/$DEVICE bs=1K seek=1
```
becouse of .imx at the end of the file name:
```
if [ `echo $UBOOT | grep -c imx` == 1 ]; then
		dd if=$UBOOT of=/dev/$DEVICE bs=1K seek=1
	else
		dd if=$UBOOT of=/dev/$DEVICE bs=1K seek=1 skip=1
	fi
```
and now it works

explanation by andi1:
```
generally abut uboot and skip: if the uboot.imx binary starts with  zeros, you need the skip
if not, you do not need it
```

By looking ot the headers at .mix and .bin files, the .mix works, and is used on the kobo nia

to get the config for the board: `make -j 6 CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm mx6ull_ntx_lpddr2_256m_defconfig`

To make ./tools/buildman/buildman to work its needed to change 2 files to python2
the boards for buildman are in boards.cfg

Some links:
- https://elinux.org/U-boot_environment_variables_in_linux
- https://www.mail-archive.com/u-boot@lists.denx.de/msg84548.html - u-boot keyboard not found?

### Update process with kobo firmware
/etc/init.d/upgrade-generic.sh

# Sound
### It works only when its charging.
explanation from andi1, from inkbox discord server
```
there might be protection diodes letting stuff go to vbus, probably higher voltages at the data lines than on vbus might be a problem
```
