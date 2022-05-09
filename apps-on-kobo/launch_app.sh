#!/bin/sh
# This file is intended to be launched by qt creator as a custom executable, for inkbox os
# LD_LIBRARY_PATH can be your qt, or used by inkbox

# Before launching this script its needed to add those custom steps:
# ifsctl mnt rootfs rw
# rm /kobo/tmp/exec|| EXIT_CODE=0
# "Upload files via SFTP" step

cd /
ash -c "killall -9 inkbox.sh inkbox inkbox-bin exec; sleep 1; killall -9 inkbox.sh inkbox inkbox-bin exec" || EXIT_CODE=0
fbink -c
chroot /kobo /bin/ash -c "env LD_LIBRARY_PATH=/mnt/onboard/.adds/qt-linux-5.15.2-kobo/lib QT_QPA_PLATFORM=kobo /tmp/exec"
# If needed, for inkbox for example:
# chroot /kobo /bin/ash -c "env LD_LIBRARY_PATH="/qt-linux-5.15.2-kobo/lib:lib" QTPATH="/qt-linux-5.15.2-kobo" QT_QPA_PLATFORM=kobo ADDSPATH="/" /tmp/inkbox"
fbink -c
