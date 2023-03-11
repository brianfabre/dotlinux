#!/bin/bash

entries="⏻ Shutdown\n⇠ Logout\n⏾ Sleep\n⭮ Reboot"

selected=$(echo -e $entries|wofi --width 250 --height 280 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  shutdown)
    # exec systemctl poweroff -i --no-wall;;
    exec shutdown -P now --no-wall;;
  logout)
    swaymsg exit;;
  reboot)
    exec systemctl reboot;;
  suspend)
    exec systemctl suspend;;
esac
