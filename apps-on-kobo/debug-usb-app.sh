#!/bin/bash
i2cset -y -f 3 0x32 0xb3 0x20
echo host > /sys/kernel/debug/ci_hdrc.0/role
killall inkbox
killall inkbox-bin
fbink -c
chroot /kobo
