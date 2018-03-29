#!/bin/bash

case $1 in
all) ./fonts.sh && ./i3lockextra.sh && ./keymap.sh && \
     ./ohmyzsh.sh && ./plug.sh && ./dotfiles.sh ;;

dotfiles) ./dotfiles.sh ;;

ohmyzsh) ./ohmyzsh.sh ;;

vimplug) ./plug.sh ;;

fonts) ./fonts.sh ;;

i3lockextra) ./i3lockextra.sh ;;

keymap) ./keymap.sh ;;

help) ./help.sh ;;

esac
