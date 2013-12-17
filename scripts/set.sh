#!/bin/bash
if [ ! -d "/opt/blackarch/captures/" ]; then
  mkdir -p /opt/blackarch/captures/
fi
cd /opt/blackarch/captures/
setoolkit
