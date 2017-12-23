#!/bin/bash

# Common dotfiles
dotfiles_install() {
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
}

# Oh-my-ZSH
oh_my_zsh_install() {
    rm -rf ~/.oh-my-zsh
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
}

# PowerLevel9k
powerlevel9k_install() {
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
}

# Vim-plug
vimplug_install() {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# Nerd-Font Complete
nerdfont_install() {
    yaourt -S nerd-fonts-complete --noconfirm
}

# Powerline Font
powerline_install() {
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
}

# Font Awesome
fontawesome_install() {
    yaourt -S ttf-font-awesome --noconfirm
}

# i3lockextra
i3lockextra_install() {
    git clone https://github.com/edlanglois/i3lock-extra
    sudo mv i3lock-extra/i3lock-extra /bin/
    rm -rf i3lock-extra
}

# Keymap
keymap_install() {
    sudo cp ./keymaps/* /usr/share/X11/xkb/symbols/
    sudo echo "KEYMAP=br-custom" > /etc/vconsole.conf
    setxkbmap -layout br-custom -variant abnt2
}

# rEFInd
refind_install() {
    cp -f ./rEFInd-minimal-black /boot/EFI/BOOT/rEFInd-minimal-black
}

help_install() {
    echo "all:          Install every option below."
    echo "dotfiles:     Link the dotfiles with the ones in this directory"
    echo "ohmyzsh:      Install oh-my-zsh"
    echo "powerlevel9k: Install PowerLevel9k"
    echo "vimplug:      Install Vim-Plug"
    echo "nerdfont:     Install Nerd Fonts Complete"
    echo "fontawesome:  Install Fonts Awesome"
    echo "powerline:    Install Powerline fonts"
    echo "fonts:        Install the 3 fonts listed above"
    echo "refind:       Install rEFInd (NEEDS SUDO), it isn't executed with "all" "
    echo "i3lockextra:  Install i3lock-extra"
    echo "keymap:       Install custom br-abnt2 keymap (NEEDS SUDO)"
}

if [ "$1" == "all" ]; then
    dotfiles_install
    oh_my_zsh_install
    powerlevel9k_install
    vimplug_install
    fontawesome_install
    nerdfont_install
    powerline_install
    keymap_install
    i3lockextra_install
elif [ "$1" == "dotfiles" ] || [ "$1" == ""]; then
    dotfiles_install
elif [ "$1" == "ohmyzsh" ]; then
    oh_my_zsh_install
elif [ "$1" == "powerlevel9k" ]; then
    powerlevel9k_install
elif [ "$1" == "vimplug" ]; then
    vimplug_install
elif [ "$1" == "fonts" ]; then
    nerdfont_install
    powerline_install
    fontawesome_install
elif [ "$1" == "fontawesome" ]; then
    fontawesome_install
elif [ "$1" == "nerdfont" ]; then
    nerdfont_install
elif [ "$1" == "powerline" ]; then
    powerline_install
elif [ "$1" == "refind" ]; then
    refind_install
elif [ "$1" == "keymap" ]; then
    keymap_install
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    help_install
else
    echo "$1 isn't a valid input"
    help_install
fi
