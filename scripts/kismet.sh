#!/bin/bash
#Script to start Kismet wireless sniffer
if [ ! -d "/opt/archassault/captures/wireless/" ]; then
  mkdir -p /opt/archassault/captures/wireless/
fi
#Set term type to vt100 for now, only thing that displays curses properly atm
export TERM=vt100

#Set ctrl c (break) to gracefully stop wlan1mon that kismet creates
trap f_endclean INT
trap f_endclean KILL

f_endclean(){
  ifconfig wlan1mon down
  ifconfig wlan1 down
}

##################################################
clear
echo
echo  "Kismet captures saved to /opt/archassault/captures/wireless/"
echo
echo

wait 3

cd /opt/archassault/captures/wireless/

kismet

f_endclean

