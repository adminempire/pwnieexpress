#!/bin/bash
#Cleartext password sniffing on all available interfaces
if [ ! -d "/opt/archassault/captures/passwords/" ]; then
  mkdir -p /opt/archassault/captures/passwords/
fi
##################################################
f_interface(){
        clear

echo "Since Dsniff currently has issues, ettercap will work like Dsniff"
echo
echo
echo "Select which interface you would like to sniff on? (1-6):"
echo
echo "1. eth0  (ethernet adapter)"
echo "2. wlan0  (Wifi 1)"
echo "3. wlan1  (Wifi 2)"
echo "4. mon0  (monitor mode interface)"
echo "5. at0  (Use with EvilAP)"
echo "6. rmnet_usb0 (GSM)"
echo

        read -p "Choice: " interfacechoice

        case $interfacechoice in
        1) f_eth0 ;;
        2) f_wlan0 ;;
        3) f_wlan1 ;;
        4) f_mon0 ;;
        5) f_at0 ;;
      	6) f_rmnet_usb0 ;;
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
f_mon0(){
        interface=mon0
}


#########################################
f_at0(){
        interface=at0
}

#########################################
f_rmnet_usb0(){
        interface=rmnet_usb0
}

f_interface


clear

echo
echo "Would you like to log data?"
echo
echo "Captures saved to /opt/archassault/captures/passwords/"
echo
echo "1. Yes"
echo "2. No "
echo

read -p "Choice: " logchoice

#If user chose to log, log to folder
#else just run cmd

if [ $logchoice -eq 1 ]
then

        filename=/opt/archassault/captures/passwords/$(date +%F-%H%M).log

        ettercap -i $interface -u -T -q | tee $filename

else

ettercap -i $interface -T -q -u

fi

