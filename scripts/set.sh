#!/bin/bash
if [ ! -d "/opt/archassault/captures/" ]; then
  mkdir -p /opt/archassault/captures/
fi
cd /opt/archassault/captures/
setoolkit
