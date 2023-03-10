# Tasmota dbus-smartmeter Service

### Purpose

This service is meant to be run on a raspberry Pi with Venus OS from Victron.

The Python script cyclically reads data from the Tasmota SmartMeter via the Tasmota Web-API and publishes information on the dbus, using the service name com.victronenergy.grid. This makes the Venus OS work as if you had a physical Victron Grid Meter installed.

### Configuration

In the Python file, you should put the IP of your Tasmota device that hosts the Web API.

### Installation

1. Get zip file:

   - wget https://github.com/SirIcy/venus.dbus-smartmeter/archive/refs/heads/main.zip

2. Run script:

   `sh installrelease.sh`


### Debugging

You can check the status of the service with svstat:

`svstat /service/dbus-smartmeter`

It will show something like this:

`/service/dbus-smartmeter: up (pid 10078) 325 seconds`

If the number of seconds is always 0 or 1 or any other small number, it means that the service crashes and gets restarted all the time.

When you think that the script crashes, start it directly from the command line:

`python /data/dbus-smartmeter/dbus-smartmeter.py`

and see if it throws any error messages.

If the script stops with the message

`dbus.exceptions.NameExistsException: Bus name already exists: com.victronenergy.grid"`

it means that the service is still running or another service is using that bus name.

#### Restart the script

If you want to restart the script, for example after changing it, just run the following command:

`/data/dbus-smartmeter/kill_me.sh`

The daemon-tools will restart the scriptwithin a few seconds.

### Hardware

In my installation at home, I am using the following Hardware:

- Tasmota IR SmartMeter
- Victron MultiPlus-II - Battery Inverter (single phase)
- Raspberry Pi 3B+ - For running Venus OS

