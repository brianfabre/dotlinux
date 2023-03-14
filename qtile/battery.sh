#!/bin/sh

# battery="/sys/class/power_supply/BAT0"
battery="/sys/class/power_supply/macsmc-battery"
status="$(cat "$battery/status")"
capacity="$(cat "$battery/capacity")"

# Set charging icon and capacity icon
[ "$status" = "Charging" ] && charging_icon=" " || charging_icon=""
[ "$capacity" -gt 100 ] && capacity=100
if   [ "$capacity" -lt 15 ]; then capacity_icon='  '
elif [ "$capacity" -lt 40 ]; then capacity_icon='  '
elif [ "$capacity" -lt 60 ]; then capacity_icon='  '
elif [ "$capacity" -lt 90 ]; then capacity_icon='  '
else capacity_icon='  '
fi

# printf "%s%s%d%%\n" "$charging_icon" "$capacity_icon" "$capacity"
printf "%s%s%d%%" "$charging_icon" "$capacity_icon" "$capacity"
