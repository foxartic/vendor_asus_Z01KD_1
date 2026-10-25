#!/system/bin/sh
ftm_status=`getprop ro.boot.pre-ftm`
enable_navbar=`getprop persist.asus.enable_navbar`
if [ $ftm_status == "1" ] ;then
	setprop qemu.hw.mainkeys 0
else
	if [ $enable_navbar == "0" ] ;then
		setprop qemu.hw.mainkeys 1
	else
		setprop qemu.hw.mainkeys 0
	fi
fi
