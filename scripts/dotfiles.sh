#!/bin/bash

CONFIG=$HOME/.config/
PARENTDIR=$(dirname `pwd`)

DOTDIR=$PARENTDIR/dotfiles
CONFIGDIR=$PARENTDIR/config

echo $DOTDIR

for i in $(ls $DOTDIR); do
    ln -svf $DOTDIR/$i $HOME/.$i
done

for i in $(ls $CONFIGDIR); do
    ln -svf $CONFIGDIR/$i $CONFIG/
done
