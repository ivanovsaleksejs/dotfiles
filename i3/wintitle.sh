#!/usr/bin/env bash
# Depends on: xdotool, wmctrl

FOCUSEDID=$(xprop -root | grep _NET_ACTIVE_WINDOW | head -1 | awk '{print $5}' | sed 's/^0x//' | sed -e 's:^:0000000:' -e 's:0\+\(.\{8\}\)$:\1:' | sed 's/^/0x/' | tr -d '\n')
FOCUSED=$(wmctrl -lp | grep $FOCUSEDID)
FPID=$(echo $FOCUSED | awk '{print $3}')
FNME=$(echo $FOCUSED | cut -f -4  -d ' ' --complement)
xdotool search -all --pid $FPID --name "$FNME" set_window -name "$*"
