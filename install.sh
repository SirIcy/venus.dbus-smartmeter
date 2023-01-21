#!/bin/bash
set -x
unzip main.zip
mv venus.dbus-smartmeter-main /data/dbus-smartmeter
chmod 755 /data/dbus-smartmeter/service/run
chmod 744 /data/dbus-smartmeter/kill_me.sh
echo "ln -s /data/dbus-smartmeter/service /service/dbus-smartmeter" >> /data/rc.local
