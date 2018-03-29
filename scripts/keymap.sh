#!/bin/bash

sudo cp ../keymaps/* /usr/share/X11/xkb/symbols/
sudo echo "KEYMAP=br-custom" > /etc/vconsole.conf
setxkbmap -layout br-custom -variant abnt2

echo "setxkbmap -layout br-custom -variant abnt2" > $HOME/.profile
