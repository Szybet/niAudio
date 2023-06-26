How to add audio to InkBox 2.0
```
ifsctl mnt rootfs rw
apk update
apk add --no-cache alsa-utils alsa-lib alsaconf musl
```
Propably too:
```
addgroup root audio
```
To check if sound card is detected, check if dmesg contains:
```
[44399.075419] usbcore: registered new interface driver snd-usb-audio
```
or `/dev/` contains something new in `/dev/snd/` or a new `/dev/hidraw*` device

If not, add this to your kernel config:
```
--- USB sound devices
<* >USB Audio/MIDI driver
```


usefull links:
- http://dl-cdn.alpinelinux.org/alpine/
- https://pkgs.alpinelinux.org/packages
- https://pkgs.alpinelinux.org/packages?branch=v3%2e10&page=2&name=alsa%2a
