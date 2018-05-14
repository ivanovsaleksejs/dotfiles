#! /usr/bin/env bash

background="#121312"
foreground="#678096"
selected="#43AAE5"
selectedb="#678096"

select=$(echo -e 'Enable 2nd display\nDisable 2nd display\nRestart bluetooth' | dmenu -nb ${background} -nf ${foreground} -sb ${background} -sf ${selected} -fn 'Source Code Pro-16' -m 0 -l 3 -i -p "What would you like to do?")

case ${select} in
        "Enable 2nd display")
                xrandr --output eDP1 --auto --output DP1 --auto --right-of eDP1
                ;;
        "Disable 2nd display")
                xrandr --auto
                ;;
        "Restart bluetooth")
                gksu systemctl restart bluetooth
                ;;
        *)
                exit 1
                ;;
        esac
