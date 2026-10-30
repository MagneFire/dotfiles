function xremap --description 'Remap X windows that sway failed to manage'
    set -l managed (swaymsg -t get_tree | jq -r '.. | objects | select(.shell? == "xwayland") | .window')
    for w in (xdotool search --onlyvisible --name $argv[1])
        if not contains -- $w $managed
            echo "remapping $w: "(xdotool getwindowname $w)
            xdotool windowunmap --sync $w windowmap --sync $w
        end
    end
end
