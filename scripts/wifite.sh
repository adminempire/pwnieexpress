#!/bin/bash
#Script to run wifite
if [ ! -d "/opt/blackarch/captures/wpa_handshakes/" ]; then
  mkdir -p /opt/blackarch/captures/wpa_handshakes/
fi
cd /opt/blackarch/captures/wpa_handshakes/

wifite

if [ -d hs ]; then
  mv hs/* .
  rm -r hs/
fi

if [ -f cracked.txt ]
then
  mv cracked.txt ../passwords/
fi

airmon-ng stop mon0
ifconfig wlan1 down

