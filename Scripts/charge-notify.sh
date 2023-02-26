#!/bin/sh

# Send a notification displaying that the battery is charging or discharging
# Pass 1 as an argument for charging, 0 for discharging
# Example usage: chargingnotify 1

# Check if argument is passed
[ $# != 1 ] && printf '0 or 1 must be passed as an argument.\nUsage: %s 0|1\n' "$0" && exit

export XAUTHORITY=/home/eric/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

BATTERY_CHARGING=$1
BATTERY_LEVEL=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')

# Send notifications
if [ "$BATTERY_CHARGING" -eq 1 ]; then
    /bin/notify-send -a "Charger Connected" "${BATTERY_LEVEL}% of battery charged." -u normal -i "/home/chilly/Images/assets/battery-charging.png" -t 5000 -r 9991
elif [ "$BATTERY_CHARGING" -eq 0 ]; then
    /bin/notify-send -a "Charger Disconnected" "${BATTERY_LEVEL}% of battery left." -u normal -i "/home/chilly/Images/assets/battery-discharging.png" -t 5000 -r 9991
fi
