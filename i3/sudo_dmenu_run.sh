#! /usr/bin/env bash
DMENU='dmenu -l 40 -i'
cachedir=${XDG_CACHE_HOME:-"$HOME/.cache"}
if [ -d "$cachedir" ]; then
    cache=$cachedir/dmenu_run
else
    cache=$HOME/.dmenu_cache # if no xdg dir, fall back to dotfile in ~
fi
choice=$(cat "$cache" | $DMENU -p "Run as su:")

if [ $choice ]; then
    gksu "${choice}"
fi
