#!/bin/zsh

playerctl status &>/dev/null
if [ $? = 0 ]; then
    artist=$(playerctl metadata artist | cut -d "%" -f 1)
    track=$(playerctl metadata title | cut -d "%" -f 1)
    echo $artist - $track
fi
