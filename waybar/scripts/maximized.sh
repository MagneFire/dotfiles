#!/bin/bash

hyprland_running=$(hyprctl activeworkspace -j)
[ $? -eq 0 ]  || exit 1

while true; do
    dunststatus=$(hyprctl activeworkspace -j | jq '.hasfullscreen')
    if [ $dunststatus = "false" ]; then
        echo '{"text":""}' | jq --unbuffered --compact-output
    else
        echo '{"text": "󰊓"}' | jq --unbuffered --compact-output
    fi
    sleep 1.0
done
