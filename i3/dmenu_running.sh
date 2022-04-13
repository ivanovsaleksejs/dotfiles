#! /usr/bin/env bash
application=$(
    wmctrl -l | awk '{$1=$2=$3=""; print substr($0, 4);}' |\
    dmenu -l 40 -i -p "Switch to window" $@
)
case ${application} in
    "")
	exit 1
	;;
    *)
	wmctrl -a "${application}"
	;;
esac
