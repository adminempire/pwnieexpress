#!/bin/bash
#script to scan current network
if [ ! -d "/opt/archassault/captures/nmap_scans/" ]; then
  mkdir -p /opt/archassault/captures/nmap_scans/
fi
##################################################
f_interface(){
        clear

echo
echo
echo "Select which interface you would like to scan on? (1-4):"
echo
echo "1. eth0  (ethernet adapter)"
echo "2. wlan0  (Wifi 1)"
echo "3. wlan1  (Wif 2)"
echo "4. at0  (Use with EvilAP)"
echo

        read -p "Choice: " interfacechoice

        case $interfacechoice in
        1) f_eth0 ;;
        2) f_wlan0 ;;
        3) f_wlan1 ;;
        4) f_at0 ;;
        *) f_interface ;;
        esac
}

#########################################
f_eth0(){
	interface=eth0
}

#########################################
f_wlan0(){
        interface=wlan0
}

#########################################
f_wlan1(){
        interface=wlan1
}

#########################################
f_at0(){
        interface=at0
}

#########################################
f_scan(){

network=$(ifconfig $interface| awk -F ":"  '/inet addr/{split($2,a," ");print a[1]}'|awk -F'.' '{print $1"."$2"."$3"."}')

cd /opt/archassault/captures/nmap_scans/

filename1="/opt/archassault/captures/nmap_scans/host_scan$(date +%F-%H%M).txt"
filename2="/opt/archassault/captures/nmap_scans/service_scan$(date +%F-%H%M).txt"

nmap -sP $network* |tee $filename1
echo
echo "Hostscan saved to /opt/archassault/captures/nmap_scans/host_scan$(date +%F-%H%M).txt"
echo
echo

echo "Do you want to run a service scan against the found devices?"
echo
echo "1. Yes"
echo "2. No"
echo

read -p "choice: " scanagain

if [ $scanagain -eq 1 ]
then
  nmap -sV $network* |tee $filename2
  echo
  echo "Hostscan saved to /opt/archassault/captures/nmap_scans/service_scan$(date +%F-%H%M).txt"
  echo
  echo
fi
}

f_interface
f_scan

if [ $interface -eq wlan1 ]
then
  ip link set wlan1 down
fi

