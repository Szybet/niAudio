transfering things described here:

https://misc.andi.de1.cc/kobo/
```
various blobs
0x400: uboot.imx
0xa0c00: dtb (prepended with length header)
0xc0000: uboot env, length 8192 bytes
0x100000: zImage (prepended with length header)
0x700000: waveform (prepended with length header), required by the epd
hwcfg (probably some relict from pre-dtb times, mainline kernel we can live without)
ntxfw (also some config stuff, on a mainline kernel we can live without)
```
across images

for waveform, there is another repo for it

## Dtb + uboot env
- offset start: 658400 ( based on this... https://www.mobileread.com/forums/showthread.php?t=316455 ) its 524288 so lets go with it
- end ( with a bit of tollerance ): 788000

so to grab it:
```
sudo dd if=<sd card or image> of=<output file> bs=1 skip=524288 count=263712
```
and to flash it
```
sudo dd if=dtb-niac of=/run/media/szybet/6CA1-F11C/inkbox-2.0-n306_a/inkbox-2.0-n306_a bs=1 seek=524288 count=263712 conv=notrunc
```
## hwcfg + ntxfw
idk? havent found anything, look at the link above
