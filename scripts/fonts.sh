#!/bin/bash

aurman -S nerd-fonts-complete ttf-font-awesome --noconfirm
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts
