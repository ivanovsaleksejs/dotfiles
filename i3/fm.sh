#! /usr/bin/env bash

file=1
while [ "$file" ]; do
	file=$(ls -1a --group-directories-first | dmenu -l 40 -p "Blader: $(basename $(pwd))")
	if [ -e "$file" ]; then
		owd=$(pwd)
		if [ -d "$file" ]; then
			cd "$file"
		else [ -f "$file" ]
			if which xdg-open &> /dev/null; then
				exec xdg-open "$owd/$file" &
				unset file
			fi
		fi
	fi
done
