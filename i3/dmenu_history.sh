#! /usr/bin/env nix-shell
#! nix-shell -i bash -p xclip


# Global variables:
DMENU='dmenu -l 40 -i'
# Show list of options
choice=$(echo $HISTFILE | $DMENU -p "History: ")

if [ $choice ]; then
    echo ${choice} | xclip -selection clipboard && xdotool type --clearmodifiers --delay 0 -- "$(xclip -o -selection clipboard)"
fi
