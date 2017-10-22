#!/bin/zsh

# Wifi icons
NM_WIFI_DIR=/usr/share/icons/hicolor/22x22/apps
MT_WIFI_DIR=$(pwd)/wifi

# Ethernet icon
NM_WIRE_DIR=/usr/share/icons/hicolor/16x16/apps
MT_WIRE_DIR=$(pwd)

IFS=$'\n'
icons=($(ls $MT_WIFI_DIR))
nm_icons=($(ls $NM_WIFI_DIR | grep nm-signal))
unset IFS

for i in $(seq 1 5); do
    cp -f $MT_WIFI_DIR/${icons[$i]} $NM_WIFI_DIR/${nm_icons[$i]}
done

cp -f $MT_WIRE_DIR/ethernet.png $NM_WIRE_DIR/nm-device-wired.png
