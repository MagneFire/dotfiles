eww --no-daemonize close hyprmsn
eww --no-daemonize close hyprmsn-closer

swaymsg mode default

swaymsg [con_id=$*] focus
hyprctl dispatch focuswindow address:$* > /dev/null
