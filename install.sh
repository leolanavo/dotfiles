#!/bin/bash

dotfiles=(Xresources bashrc zshrc compton.conf gitconfig inputrc vimrc)
directories=(i3 nvim polybar termite ranger)

CONFIG=$HOME/.config/
CURDIR=$(pwd)

for i in ${dotfiles[@]}; do
    ln -svf $CURDIR/$i $HOME/.$i
done

for i in ${directories[@]}; do
	rm -rf $CONFIG/$i
    ln -svf $CURDIR/$i $CONFIG/
done
