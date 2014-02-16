#!/bin/bash
#TcpDump script for sniffing on available interfaces
if [ ! -d "/opt/archassault/captures/tcpdump/" ]; then
  mkdir -p /opt/archassault/captures/tcpdump/
fi
##################################################
f_interface(){
        clear

echo
echo
echo "Select which interface you would like to sniff on? (1-6):"
echo
echo "1. eth0  (ethernet adapter)"
echo "2. wlan0  (Wifi 1)"
echo "3. wlan1  (Wifi 2)"
echo "4. mon0  (monitor mode interface)"
echo "5. at0  (Use with EvilAP)"
echo "6. rmnet0 (4G GSM)"
echo

        read -p "Choice: " interfacechoice

        case $interfacechoice in
        1) f_eth0 ;;
        2) f_wlan0 ;;
        3) f_wlan1 ;;
        4) f_mon0 ;;
        5) f_at0 ;;
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
f_rmnet0(){
        interface=rmnet0
}


f_savecap(){
        clear

echo
echo
echo "Would you like to save a packet capture to /opt/archassault/captures/tcpdump?"
echo "Note you can't see packets on screen when writing to a file"
echo
echo "1. Yes"
echo "2. No"
echo

        read -p "Choice: " saveyesno

        case $saveyesno in
        1) f_yes ;;
        2) f_no ;;
        *) f_savecap ;;
        esac
}

#########################################
f_yes(){
	filename=tcpdump$(date +%F-%H%M).cap

        tcpdump -s0 -vvv -e -xx -w /opt/archassault/captures/tcpdump/$filename -i $interface

}

#########################################
f_no(){
	tcpdump -s0 -vvv -e -i $interface

}


f_interface

f_savecap

