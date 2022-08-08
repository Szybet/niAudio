UBOOT=$1
WAVEFORM=$2
KERNEL=$3
DEVICE=$4
FW=$5
DTB=$6

if [ -e $UBOOT ]; then
	echo Upgrading U-Boot $UBOOT
	if [ `echo $UBOOT | grep -c imx` == 1 ]; then
		dd if=$UBOOT of=/dev/$DEVICE bs=1K seek=1
	else
		dd if=$UBOOT of=/dev/$DEVICE bs=1K seek=1 skip=1
	fi
	if [ $? != 0 ] ; then
		exit 1
	fi
	sync
	sync
	echo Done upgrading U-Boot
fi

if [ -e $WAVEFORM ]; then
	echo Upgrading Waveform $WAVEFORM
	dd if=$WAVEFORM.header of=/dev/$DEVICE bs=512 seek=14335
	dd if=$WAVEFORM of=/dev/$DEVICE bs=512 seek=14336
	if [ $? != 0 ] ; then
		exit 1
	fi
	sync
	sync
	echo Done upgrading Waveform
fi

if [ -e $KERNEL ]; then
	echo Upgrading kernel... $KERNEL
	if [ `echo $KERNEL | grep -c ntx` == 1 ]; then
		dd if=/dev/zero of=/dev/$DEVICE bs=512 seek=2047 count=1
	fi
	dd if=$KERNEL of=/dev/$DEVICE bs=512 seek=2048
	if [ $? != 0 ]; then
		exit 1
	fi
	sync
	sync
	echo Done upgrading kernel...
fi

if [ -e $FW ]; then
	echo Upgrading fw... $FW
	[ -e $FW.header ] && dd if=$FW.header of=/dev/$DEVICE bs=512 seek=1029
	dd if=$FW of=/dev/$DEVICE bs=512 seek=1030
	if [ $? != 0 ]; then
		exit 1
	fi
	sync
	sync
	echo Done upgrading fw...
fi

if [ -e $DTB ]; then
	echo Upgrading DTB... $DTB
	[ -e $DTB.header ] && dd if=$DTB.header of=/dev/$DEVICE bs=512 seek=1285
	dd if=$DTB of=/dev/$DEVICE bs=512 seek=1286
	if [ $? != 0 ]; then
		exit 1
	fi
	sync
	sync
	echo Done upgrading DTB...
fi
