## Notes
### Usb controler:
The usb controler is ChipIdea Highspeed Dual Role Controller Driver, the module is ci_hdrc
```
<*>   ChipIdea Highspeed Dual Role Controller
  [*]     ChipIdea device controller
  [*]     ChipIdea host controller
```
Some links:
- https://elixir.bootlin.com/linux/v4.15/source/Documentation/usb/chipidea.txt

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

Some links:
- https://www.mobileread.com/forums/showthread.php?t=316455
- https://github.com/pazos/linux-2.6.35.3-kobo/blob/master/arch/arm/mach-mx5/ntx_hwconfig.c
- **https://github.com/XCSoar/XCSoar/pull/634**

### u-boot

Some links:
- https://elinux.org/U-boot_environment_variables_in_linux
