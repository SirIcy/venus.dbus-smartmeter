#!/bin/bash
set -x
unzip main.zip
mv venus.dbus-smartmeter-main /data/dbus-smartmeter
chmod 755 /data/dbus-smartmeter/service/run
chmod 744 /data/dbus-smartmeter/kill_me.sh
if [ -f /data/rc.local ];
then
 echo "ln -s /data/dbus-smartmeter/service /service/dbus-smartmeter" >> /data/rc.local
else
 echo -e "#!/bin/bash\nln -s /data/dbus-smartmeter/service /service/dbus-smartmeter" > /data/rc.local
 chmod 755 /data/rc.local
fi
