#! /usr/bin/env bash
# d-nixos: Use dmenu to install and launch package via nix-shell

# Global variables:
DMENU='dmenu -l -i'
# Show list of options
choice=$(nix search | grep "Package name:" | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" | cut -d: -f2- | cut -c 2- | $DMENU -p "Package:")

if [ $choice ]; then
    nix-shell -p "${choice}" --run "${choice}"
fi
