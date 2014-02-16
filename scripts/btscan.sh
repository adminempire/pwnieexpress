#!/bin/sh
#Bluetooth scanning / loggin script
if [ ! -d "/opt/archassault/captures/bluetooth/" ]; then
  mkdir -p /opt/archassault/captures/bluetooth/
fi

cd /opt/archassault/captures/bluetooth/

hciconfig hci0 up

echo
echo "Bluetooth Device Scan log saved in /opt/archassault/captures/bluetooth/"
echo

btscanlogname=hcitool$(date +%F-%H%M).log

while [ 1 ]
do
	hcitool -i hci0 scan --flush --class --info

        hcitool -i hci0 scan --flush --class --info >> /opt/archassault/captures/bluetooth/$btscanlogname

done
