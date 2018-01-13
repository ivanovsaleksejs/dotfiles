#! /usr/bin/env bash
d=$(date '+%d_%m_%Y_%H_%M_%S');
echo -n "http://aleksejs.net/images/shot_$d.png" | xclip -selection clipboard
scp -p $1 aleksejs@aleksejs.net:/usr/share/nginx/html/images/shot_$d.png
ssh aleksejs@aleksejs.net chmod 644 /usr/share/nginx/html/images/shot_$d.png
