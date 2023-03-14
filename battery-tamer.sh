#!/bin/bash

while true
do
    # Get the current battery percentage
    battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ $battery_level -gt 60 ]; then
        # Stop charging if the battery level is above 60%
        echo 0 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
    elif [ $battery_level -lt 55 ]; then
        # Start charging if the battery level is below 55%
        echo 100 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
    fi

    # Wait for 1 minute before checking the battery level again
    sleep 60
done