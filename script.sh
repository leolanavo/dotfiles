#!/bin/bash



#spotify installation details
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update

#Installation by apt-get
sudo apt-get install spotify-client
sudo apt-get install vim
sudo apt-get install python3
sudo apt-get install git
sudo apt-get install ssh
sudo apt-get install tweak-unity-tool
sudo apt-get install sublime-text

#Dotfiles installation
rm -f .bashrc
git init
git remote add origin https://www.github.com/leolanavo/dotfiles
git pull origin master

#Vim Plugins
git clone https://github.com/powerline/fonts.git ~/fonts
./fonts/install.sh

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
