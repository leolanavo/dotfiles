#!/bin/sh

 xrandr | grep 'HDMI1 connected' &&
    xrandr --output eDP1 --auto --output HDMI1 --auto --left-of eDP1

