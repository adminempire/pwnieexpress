#!/bin/sh
#Bluetooth scanning / loggin script
if [ ! -d "/opt/blackarch/captures/bluetooth/" ]; then
  mkdir -p /opt/blackarch/captures/bluetooth/
fi

cd /opt/blackarch/captures/bluetooth/

hciconfig hci0 up

echo
echo "Bluetooth Device Scan log saved in /opt/blackarch/captures/bluetooth/"
echo

btscanlogname=hcitool$(date +%F-%H%M).log

while [ 1 ]
do
	hcitool -i hci0 scan --flush --class --info

        hcitool -i hci0 scan --flush --class --info >> /opt/blackarch/captures/bluetooth/$btscanlogname

done
