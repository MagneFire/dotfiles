#!/bin/bash

while true; do
    dunststatus=$(swaync-client -D)
    if [ $dunststatus = "false" ]; then
        echo '{"text": "󰂚", "alt": "notification", "class": "collapsed"}' | jq --unbuffered --compact-output
    else
        echo '{"text": "󰂛", "alt": "notification", "class": "collapsed_muted"}' | jq --unbuffered --compact-output
    fi
    sleep 1.0
done
