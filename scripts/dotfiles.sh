#!/bin/bash

dotfiles=(Xresources bashrc zshrc gitconfig inputrc vimrc compton.conf)
directories=(i3 nvim polybar termite ranger)

CONFIG=$HOME/.config/
PARENTDIR=$(dirname `pwd`)
DOTDIR=$PARENTDIR/dotfiles


echo $DOTDIR

for i in ${dotfiles[@]}; do
    ln -svf $DOTDIR/$i $HOME/.$i
done

for i in ${directories[@]}; do
    rm -rf $CONFIG/$i
    ln -svf $PARENTDIR/$i $CONFIG/
done
