#! /usr/bin/env bash

background="#121312"
foreground="#678096"
selected="#43AAE5"
selectedb="#678096"

select=$(echo -e 'Suspend\nReboot\nShutdown' | dmenu -nb ${background} -nf ${foreground} -sb ${background} -sf ${selected} -fn 'Source Code Pro-16' -m 0 -l 3 -i -p "What would you like to do?")

case ${select} in
        "Suspend")
                i3exit suspend
                ;;
        "Reboot")
                i3exit reboot
                ;;
        "Shutdown")
                i3exit shutdown
                ;;
        *)
                exit 1
                ;;
        esac
