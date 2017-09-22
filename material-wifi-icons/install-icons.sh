#!/bin/zsh

NMDIR=/usr/share/icons/hicolor/22x22/apps
MTDIR=$(pwd)/png
IFS=$'\n'
icons=($(ls $MTDIR))
nm_icons=($(ls $NMDIR | grep nm-signal))
unset IFS

for i in $(seq 1 5); do
    cp -f $MTDIR/${icons[$i]} $NMDIR/${nm_icons[$i]}
done

