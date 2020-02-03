#! /usr/bin/env bash
# d-nixos: Use dmenu to install and launch package via nix-shell

# Global variables:
DMENU='dmenu -l 40 -i'
# Show list of options
choice=$(nix search | grep "^* " | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" | sed -r "s/.*\((.*)\)/\1/g" | $DMENU -p "Package:")

if [ $choice ]; then
    nix-shell -p "${choice}" --run "${choice}"
fi
