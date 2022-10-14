#!/bin/bash

TOUCHPAD_STATE="$1"

if [[ $TOUCHPAD_STATE = "" ]]; then
	echo "Mouse state not provided"
	exit 1
fi

TOUCHPAD=$(xinput list | grep 'Touchpad' | awk '{printf ("%5s %s %s", $3, $4, $5)}')

xinput $TOUCHPAD_STATE "${TOUCHPAD}"