#!/bin/sh
#Bluetooth scanning / loggin script

hciconfig hci0 up
if [ ! -d "/opt/archassault/captures/bluetooth/" ]; then
  mkdir -p /opt/archassault/captures/bluetooth/
fi
cd /opt/archassault/captures/bluetooth/

echo
echo "Bluetooth Device Scan log saved in /opt/archassault/captures/bluetooth/"
echo

#btscanlogname=bluelog$(date +%F-%H%M).log

bluelog -vtnc -i hci0

