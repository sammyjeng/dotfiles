#!/usr/bin/bash
upower -i /org/freedesktop/UPower/devices/battery_BAT0 | egrep "(state|percentage)" | xargs echo | awk -F : '{print$2":"$3}'
