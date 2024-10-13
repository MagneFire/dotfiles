#!/bin/bash

entries="⭮\tReboot\n⏻\tShutdown\n⇠\tLogout\n⏾\tSuspend\n⏾\tHibernate"

selected=$(echo -e $entries | wofi --width 200 --height 180 --dmenu --conf ~/.config/hypr/scripts/powermenu.config --style ~/.config/hypr/scripts/powermenu.css --hide-scroll --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    exec hyprctl dispatch exit NOW;;
  hibernate)
    exec systemctl hibernate;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
