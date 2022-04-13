#! /usr/bin/env nix-shell
#!nix-shell -i bash -p jq dmenu

dmenu='dmenu -l 40 -i'

workspace=$(i3-msg -t get_workspaces | jq '.[] | .name' | $dmenu -p "Workspace:")

i3-msg workspace "${choice}"
