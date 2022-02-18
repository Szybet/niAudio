#!/bin/sh

if [ -e /mnt/onboard/.kobo/manifest.md5sum ]; then 
	cd /mnt/onboard/.kobo
	md5sum -c manifest.md5sum
	if [ $? != 0 ]; then
		rm -rf manifest.md5sum
		exit 1;
	fi
	rm -rf manifest.md5sum
	cd /
fi

PLATFORM=freescale
if [ `dd if=/dev/mmcblk0 bs=512 skip=1024 count=1 | grep -c "HW CONFIG"` == 1 ]; then
	CPU=`ntx_hwconfig -s -p /dev/mmcblk0 CPU`
	PLATFORM=$CPU-ntx
fi

if [ $PLATFORM == freescale ] || [ $PLATFORM == mx50-ntx ] || [ $PLATFORM == mx6sl-ntx ] || [ $PLATFORM == mx6sll-ntx ] || [ $PLATFORM == mx6ull-ntx ]; then

	UBOOT=not_used
	KERNEL=not_used
	FW=not_used
	DTB=not_used

	if [ $CPU ]; then
		PCB=`ntx_hwconfig -s -p /dev/mmcblk0 PCB`
		if [ $PCB != E60610 ]; then
			PCB_LVL=`ntx_hwconfig -s -p /dev/mmcblk0 PCB_LVL`
			PCB_REV=`ntx_hwconfig -s -p /dev/mmcblk0 PCB_REV`
			RAM=`ntx_hwconfig -s -p /dev/mmcblk0 RAMType`
			RAM_SIZE=`ntx_hwconfig -s -p /dev/mmcblk0 RamSize`
			RAM_SIZE=`echo $RAM_SIZE | awk '{print $RAM_SIZE-MB}'`
			FL_TAB=`ntx_hwconfig -s -p -d /dev/mmcblk0 FrontLight`
			FW=/mnt/onboard/.kobo/upgrade/$PLATFORM/ntxfw-$PCB$PCB_LVL$PCB_REV-FL$FL_TAB.bin
			[ ! -e "$FW" ] && FW=/mnt/onboard/.kobo/upgrade/$PLATFORM/ntxfw-$PCB$PCB_LVL$PCB_REV.bin
			[ ! -e "$FW" ] && FW=/mnt/onboard/.kobo/upgrade/$PLATFORM/ntxfw-$PCB$PCB_LVL-FL$FL_TAB.bin
			[ ! -e "$FW" ] && FW=/mnt/onboard/.kobo/upgrade/$PLATFORM/ntxfw-$PCB$PCB_LVL.bin
			[ ! -e "$FW" ] && FW=/mnt/onboard/.kobo/upgrade/$PLATFORM/ntxfw-$PCB-FL$FL_TAB.bin
			[ ! -e "$FW" ] && FW=/mnt/onboard/.kobo/upgrade/$PLATFORM/ntxfw-$PCB.bin
			[ ! -e "$FW" ] && FW=not_used

			if [ $CPU == mx6sll ] || [ $CPU == mx6ull ]; then
				DTB=/mnt/onboard/.kobo/upgrade/$PLATFORM/$CPU-$PCB$PCB_LVL$PCB_REV.dtb
				[ ! -e "$DTB" ] && DTB=/mnt/onboard/.kobo/upgrade/$PLATFORM/$CPU-$PCB$PCB_LVL.dtb
				[ ! -e "$DTB" ] && DTB=/mnt/onboard/.kobo/upgrade/$PLATFORM/$CPU-$PCB.dtb
				[ ! -e "$DTB" ] && DTB=not_used
			fi
		fi
		NEW_UBOOT=/mnt/onboard/.kobo/upgrade/$PLATFORM/u-boot_mddr_$RAM_SIZE-$PCB-$RAM.bin
		NEW_KERNEL=/mnt/onboard/.kobo/upgrade/$PLATFORM/uImage-$PCB$PCB_LVL
		[ ! -e "$NEW_KERNEL" ] && NEW_KERNEL=/mnt/onboard/.kobo/upgrade/$PLATFORM/uImage-$PCB
		if [ $CPU == mx6sll ] || [ $CPU == mx6ull ]; then
			NEW_UBOOT=/mnt/onboard/.kobo/upgrade/$PLATFORM/u-boot-$CPU-$PCB-$RAM-$RAM_SIZE\MB.imx
			NEW_KERNEL=/mnt/onboard/.kobo/upgrade/$PLATFORM/zImage-$PCB
		else
			[ ! -e "$NEW_UBOOT" ] && NEW_UBOOT=/mnt/onboard/.kobo/upgrade/$PLATFORM/u-boot_lpddr2_$RAM_SIZE-$PCB$PCB_LVL-$RAM.bin
			[ ! -e "$NEW_UBOOT" ] && NEW_UBOOT=/mnt/onboard/.kobo/upgrade/$PLATFORM/u-boot_lpddr2_$RAM_SIZE-$PCB-$RAM.bin
		fi
		UBOOT=$NEW_UBOOT
		KERNEL=$NEW_KERNEL
	fi

	WAVEFORM=/mnt/onboard/.kobo/upgrade/waveform

	[ $PLATFORM == freescale ] && UBOOT=/mnt/onboard/.kobo/upgrade/freescale/u-boot.bin
	[ $PLATFORM == freescale ] && KERNEL=/mnt/onboard/.kobo/upgrade/freescale/uImage

	echo your platform is $PLATFORM
	echo $UBOOT
	echo $KERNEL
	echo $FW
	echo $DTB

	/etc/init.d/upgrade-generic.sh $UBOOT $WAVEFORM $KERNEL mmcblk0 $FW $DTB

else

	PCB=`ntx_hwconfig -s -p /dev/mmcblk0 PCB`
	/etc/init.d/upgrade-$PLATFORM.sh /mnt/onboard/.kobo/upgrade/$PLATFORM/$PCB

	if [ $? == 0 ]; then
		echo "platform upgrade not supported"
	fi

fi

exit $?

