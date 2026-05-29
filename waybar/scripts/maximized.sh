#!/bin/bash
# Show an icon when any window on the focused workspace is fullscreened.
# Niri port of the hyprctl-based original.

set -euo pipefail

empty='{"text":""}'
full='{"text": "󰊓"}'

while true; do
    # Focused workspace id, then check if any window on that workspace is fullscreen.
    focused_ws=$(niri msg --json workspaces | jq -r '[.[] | select(.is_focused)][0].id')

    is_full=$(niri msg --json windows | jq -r --argjson ws "$focused_ws" '
        any(.[]; .workspace_id == $ws and (.is_fullscreen == true))
    ')

    if [[ "$is_full" == "true" ]]; then
        echo "$full"
    else
        echo "$empty"
    fi
    sleep 1.0
done
