#!/bin/bash
#Script to run airodump-ng without any flags

#set ctrl c (break) to gracefully take the card out of monitor mode
trap f_cleanup INT
trap f_cleanup KILL
if [ ! -d "/opt/archassault/captures/wireless/" ]; then
  mkdir -p /opt/archassault/captures/wireless/
fi
cd /opt/archassault/captures/wireless/

f_logornot(){

	clear
	echo
	echo "Would you like to save an airodump capture?"
	echo
	echo "Captures saved to /opt/archassault/captures/wireless/"
	echo
	echo "1. Yes"
	echo "2. No "
	echo

	read -p "Choice: " logchoice
}

f_run(){

	if [ $logchoice -eq 1 ]
	then
	airmon-ng start wlan1
	airodump-ng -w airodump mon0
	else

	airmon-ng start wlan1
	airodump-ng mon0
	fi
}

f_cleanup(){
airmon-ng stop mon0
ip link set wlan1 down
}
f_logornot
f_run


