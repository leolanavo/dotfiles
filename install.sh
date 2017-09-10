#!/bin/bash

dotfiles=(Xresources bashrc zshrc compton.conf gitconfig inputrc vimrc)
nvimfile=init.vim

configdir=$HOME/.config/
curdir=$(pwd)

for i in ${dotfiles[@]}; do
    ln -sf $curdir/$i $HOME/.$i
done

# nvim linking
ln -sf $curdir/$nvimfile $configdir/nvim/$nvimfile

# i3 linking
ln -sf $curdir/i3/config $configdir/i3/config

# polybar linking
ln -sf $curdir/polybar/config $configdir/polybar/config

