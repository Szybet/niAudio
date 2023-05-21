cd /
ash -c "killall -9 inkbox.sh inkbox inkbox-bin exec; sleep 1; killall -9 inkbox.sh inkbox inkbox-bin exec" || EXIT_CODE=0

fbink -c
# chroot /kobo /bin/ash -c "env LD_LIBRARY_PATH=/mnt/onboard/.adds/qt-linux-5.15.2-kobo/lib QT_QPA_PLATFORM=kobo /tmp/exec"

# chroot /kobo /bin/ash -c "env LD_LIBRARY_PATH="/qt-linux-5.15.2-kobo/lib:lib" QTPATH="/qt-linux-5.15.2-kobo" QT_QPA_PLATFORM=kobo ADDSPATH="/mnt/onboard/.adds/" PATH="${PATH}:/mnt/onboard/.adds/Python-3.9.2/" DEBUG=true QT_FONT_DPI=$(cat /kobo/mnt/onboard/.adds/inkbox/.config/09-dpi/config) LD_PRELOAD=/lib/invert_screen.so /tmp/exec"

umount -l -f /kobo/mnt/onboard/.adds/inkbox/inkbox-bin
mount --bind /kobo/tmp/exec /kobo/mnt/onboard/.adds/inkbox/inkbox-bin
#/usr/bin/inkbox.sh; read;
env QT_QPA_PLATFORM=kobo chroot /kobo /mnt/onboard/.adds/inkbox/inkbox.sh

fbink -c

# This approach for qt creator is faster, just launch the script:
##!/bin/bash

#mv inkbox exec

#servername="root@10.42.0.28"
#passwd="root"

#sshpass -p $passwd ssh $servername "bash -c \"ifsctl mnt rootfs rw\""
#sshpass -p $passwd ssh $servername "bash -c \"rm /kobo/tmp/exec\""
#sshpass -p $passwd scp exec $servername:/kobo/tmp/

#sshpass -p $passwd ssh $servername "bash -c \"sync\""

