#! /usr/bin/env bash

file=$(echo -e 'vim\ni3\nnixos\ntmux' | fzf --header='Cheat sheets' --layout=reverse --prompt 'Select cheat sheet: ')
less ~/git/dotfiles/i3/cheatsheets/$file.txt
