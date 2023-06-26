How to add audio to InkBox 2.0
```
ifsctl mnt rootfs rw
apk update
apk add --no-cache alsa-utils alsa-lib alsaconf
```
Propably too:
```
addgroup root audio
```


usefull links:
- http://dl-cdn.alpinelinux.org/alpine/
- https://pkgs.alpinelinux.org/packages
- https://pkgs.alpinelinux.org/packages?branch=v3%2e10&page=2&name=alsa%2a
