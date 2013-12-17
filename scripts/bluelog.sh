#!/bin/sh
#Bluetooth scanning / loggin script

hciconfig hci0 up
if [ ! -d "/opt/blackarch/captures/bluetooth/" ]; then
  mkdir -p /opt/blackarch/captures/bluetooth/
fi
cd /opt/blackarch/captures/bluetooth/

echo
echo "Bluetooth Device Scan log saved in /opt/blackarch/captures/bluetooth/"
echo

#btscanlogname=bluelog$(date +%F-%H%M).log

bluelog -vtnc -i hci0

