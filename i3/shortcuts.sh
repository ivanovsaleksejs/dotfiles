#! /usr/bin/env bash

background="#121312"
foreground="#678096"
selected="#43AAE5"
selectedb="#678096"

select=$(echo -e '2nd display on left\n2nd display on right\nDisable 2nd display\nMount moon\nUmount moon' | dmenu -nb ${background} -nf ${foreground} -sb ${background} -sf ${selected} -fn 'Source Code Pro-16' -m 0 -l 5 -i -p "What would you like to do?")

case ${select} in
        "2nd display on left")
                xrandr --output eDP-1 --auto --output DP-1 --auto --noprimary --left-of eDP-1
                ;;
        "2nd display on right")
                xrandr --output eDP-1 --auto --output DP-1 --auto --noprimary --right-of eDP-1
                ;;
        "Disable 2nd display")
                xrandr --auto
                ;;
        "Mount moon")
                gksu mount smb://10.0.3.155/moon /home/aleksejs/Documents/janaseta/moon/ -t cifs
                ;;
        "Umount moon")
                gksu umount /home/aleksejs/Documents/janaseta/moon
                ;;
        *)
                exit 1
                ;;
        esac
