#! /usr/bin/env bash
# d-nixos: Use dmenu to install and launch package via nix-shell

# Global variables:
DMENU='dmenu -l -i'
# Show list of options
choice=$(nix-env -qaP --no-name | cut -c 7- | $DMENU -p "Package:")

if [ $choice ]; then
    nix-shell -p "${choice}" --run "${choice}"
fi
