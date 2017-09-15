#!/bin/bash

xdg-open https://mail.google.com
i3-msg workspace $(i3-msg -t get_workspaces | sed -e "s/},{/\n/g" | grep -e "\"urgent\":true" | cut -d : -f 2 | cut -d , -f 1)
