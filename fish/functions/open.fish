function open --description "Open a file or folder in the background"
    argparse --name=open 'w/with=' 'l/list' 'h/help' -- $argv
    or return 1

    if set -q _flag_help
        echo "Usage: open [--with APP] [--list] [TARGET]"
        echo
        echo "  TARGET            file or folder to open (default: .)"
        echo "  -w, --with APP    launch a specific app by desktop id (e.g. libreoffice-calc),"
        echo "                    bypassing the registered default"
        echo "  -l, --list        list the apps registered for TARGET's mimetype and exit"
        return 0
    end

    set -l target $argv[1]
    test -z "$target"; and set target .

    if set -q _flag_list
        set -l mime (xdg-mime query filetype "$target" 2>/dev/null)
        if test -z "$mime"
            echo "open: could not determine mimetype of '$target'" >&2
            return 1
        end
        echo "$target: $mime"
        gio mime "$mime"
        return 0
    end

    if set -q _flag_with
        set -l app (string replace -r '\.desktop$' '' -- $_flag_with)

        # Resolve the desktop entry up front: gtk-launch's own errors are discarded.
        set -l dirs $HOME/.local/share/applications
        set -l datadirs $XDG_DATA_DIRS
        test -z "$datadirs"; and set datadirs /usr/local/share:/usr/share
        for d in (string split ':' -- $datadirs)
            test -n "$d"; and set -a dirs (string replace -r '/+$' '' -- $d)/applications
        end

        set -l found 0
        for d in $dirs
            if test -f "$d/$app.desktop"
                set found 1
                break
            end
        end
        if test $found -eq 0
            echo "open: no desktop entry named '$app.desktop'" >&2
            echo "open: run 'open --list $target' to see the registered candidates" >&2
            return 1
        end

        setsid gtk-launch $app $target >/dev/null 2>&1 &
        disown
        return 0
    end

    setsid xdg-open $target >/dev/null 2>&1 &
    disown
end
