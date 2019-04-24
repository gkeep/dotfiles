#!/bin/bash
while true;
do
	STR=""
	# battery
	percent="$( acpi | awk '{ print $4; }' | sed 's/\,//g' )"
	status="$( acpi | awk '{ print $3; }' | sed 's/\,//g' )"
	STR+=" /  $status $percent"
	# song
	title="$( playerctl metadata title )"
	artist="$( playerctl metadata artist )"

	STR+=" /  $artist - $title"
	# Volume
	mute="$( pamixer --get-mute )"

	if [ "$mute" == "false" ]; then
		vol="$( pamixer --get-volume )"
		STR+=" /  $vol%"
	else
		STR+=" / muted"
	fi
	
	# Temp
	temp="$( sensors | grep Package | awk '{ print $4; }' | sed 's/\+//g' )"
	STR+=" /  $temp"
	
	# Connection
	ssid="$( nmcli device status | grep connected | awk '{print $4;}' | sed 's/\-//g' )"
	if [[ $ssid != "--" ]]; then
		STR+=" /  $ssid"
	else
		STR+=" / disconnected"
	fi

	# Date/Time
	time=$( date +'%R' )
	STR+=" /  $time"
	
	xsetroot -name "$STR"
	sleep 1
done

