#!/bin/bash
i2cset -y -f 3 0x32 0xb3 0x20
echo host > /sys/kernel/debug/ci_hdrc.0/role
killall inkbox
killall inkbox-bin
fbink -c
echo 2 > /sys/class/graphics/fb0/rotate
echo 2 > /kobo/sys/class/graphics/fb0/rotate
chroot /kobo
