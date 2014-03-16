#!/bin/sh +x
#/usr/bin/macchanger --help
#Roll MAC address and hostname

#get Interface to change mac address of:
#!/bin/bash
#script to select interface for sniffing / stripping

##################################################
f_interface(){
        clear

echo 
echo 
echo "Select which interferace to randomly roll mac of? (1-3):"
echo 
echo "1. eth0  (USB ethernet adapter)"
echo "2. wlan0  (Internal Nexus Wifi)"
echo "3. wlan1  (USB TPlink Atheros)"
echo

        read -p "Choice: " interfacechoice

        case $interfacechoice in
        1) f_eth0 ;;
        2) f_wlan0 ;;
        3) f_wlan1 ;;
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

f_interface


echo 
echo Rolling MAC address of wlan0 to something random...
echo To specify MAC to spoof run sudo macchanger -m xx:xx:xx:xx:xx:xx
echo 
ip link set $interface down
macchanger -r $interface
sleep 1
echo
echo Mac is now rolled!

echo
echo 
echo
echo Rolling hostname for further obscuring...
echo 
mac=$(ip addr | grep -A 3 $interface | grep ether | awk '{print$2}' | awk -F":" '{print$1$2$3$4$5$6}')
hn=$mac
sudo hostname $hn
echo hostname $hn
echo
echo Hostname is now rolled!
echo 

ip link set $interface up
ip addr | grep -A 5 $interface

echo 
echo "MAC for " $interface " and Hostname are now rolled!"

