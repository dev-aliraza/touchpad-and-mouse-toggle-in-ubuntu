#!/bin/bash

PWD=$(dirname "$0")
SLEEP_TIME=5
DEBUG=0

while :
do
	IS_MOUSE_CONNECTED=$(xinput list | grep -wi 'usb' | grep -wi 'mouse')

	if [[ $IS_MOUSE_CONNECTED = "" ]]; then
		$PWD/mouse_toggle.sh enable
		if [ $DEBUG = 1 ]; then
			echo "Mouse not connected"
		fi
	fi

	if [[ $IS_MOUSE_CONNECTED != "" ]]; then
		$PWD/mouse_toggle.sh disable
		if [ $DEBUG = 1 ]; then
			echo "Mouse connected"
		fi
	fi

	sleep $SLEEP_TIME
done