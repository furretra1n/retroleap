#!/bin/sh

CONFIG=/configs/retroarch.cfg.leapstergs

# Really any file to indicate lf1000 will do. 
# This will eventually need to be expanded to account for leappad1.
# However, the config should be the same across Explorer and Didj.
if [[ -f /sys/bus/platform/drivers/lf1000-gpio/bind ]]; then
    CONFIG=/configs/retroarch.cfg.lf1000
fi


valencia=$(fbset | grep 480x272)
if [[ $? == 0 ]]; then
    CONFIG=/configs/retroarch.cfg.leappad2
fi

rio=$(fbset | grep 1024x600)
if [[ $? == 0 ]]; then
    CONFIG=/configs/retroarch.cfg.leappadultra
fi



export HOME=/configs

if [[ ! -f "/configs/.config/retroarch/retroarch.cfg" ]];
then
	mkdir -p /configs/.config/retroarch
	cp $CONFIG /configs/.config/retroarch/retroarch.cfg
fi


# If gmenunx is present, run it instead of retroarch.
# TODO: Fix this to be more graceful across different devices etc.
if [[ -f "/usr/share/gmenunx/gmenunx" && ! -f "/flags/boot_to_retroarch" ]];
then
	while `true`
	do
          # Volume control slider for Didj
	  /usr/share/gmenunx/./gmenunx
	  echo "Restarting gmenunx...."
	done
else

	while `true`
	do
	  echo 0 > /sys/devices/platform/lf2000-fb.0/graphics/fb0/blank
	  export SDL_NOMOUSE=1
	  retroarch -v -c $CONFIG 2> /root/retro.log
	  echo "Restarting program..."
	done
fi
