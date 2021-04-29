#!/bin/bash

killall -q polybar

while pgrep -x polybar >/dev/null; do 
    sleep 1; 
done

list=$(xrandr | grep -e "\ connected" | cut -d " " -f 1)
for i in $list; do
    MONITOR=$i polybar top &
done
