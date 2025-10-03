eww --no-daemonize close hyprmsn
eww --no-daemonize close hyprmsn-closer
swaymsg [con_id=$*] focus
hyprctl dispatch focuswindow address:$* > /dev/null
