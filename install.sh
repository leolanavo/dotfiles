#!/bin/bash

ln -sf vimrc ~/.vimrc
ln -sf inputrc ~/.inputrc
ln -sf gitconfig ~/.gitconfig
ln -sf bashrc ~/.bashrc
ln -sf vim ~/.vim

git clone https://github.com/ryanoasis/nerd-fonts
git clone https://github.com/powerline/fonts

./fonts/install.sh
./nerd-fonts/install.sh
