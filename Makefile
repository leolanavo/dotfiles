
NVIMDIR  := $(HOME)/.config/nvim
FONTSDIR := $(HOME)/.customfonts
VIMDIR   := $(HOME)/.vim 
PWD      := $(shell pwd)

LINK	 := ln -sf
CLONE    := git clone

NVIM     := init.vim
INITNVIM := $(patsubst %, $(NVIMDIR)/%, $(NVIM))

FILES 	 := vimrc inputrc bashrc tmux.conf gitconfig zshrc
DOTFILES := $(patsubst %, $(HOME)/.%, $(FILES))

$(NVIMDIR) $(VIMDIR):
	mkdir -p $@

$(FONTSDIR):
	rm -rf $(FONTSDIR)
	mkdir -p $@

.PHONY: dotfiles
dotfiles: $(DOTFILES) $(INITNVIM) 

$(HOME)/.%: $(PWD)/%
	$(LINK)

.PHONY: zsh
zsh:
	rm -rf $(HOME)/.oh-my-zsh
	wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -
	bash install.sh
	rm -rf install.sh
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

.PHONY: nvim
nvim: $(INITNVIM)

$(INITNVIM): $(NVIMDIR)
	$(LINK) $(PWD)/$(NVIM) $@

.PHONY: fonts
fonts:
	$(CLONE) https://github.com/ryanoasis/nerd-fonts $(FONTSDIR)/nerd/
	$(CLONE) https://github.com/powerline/fonts $(FONTSDIR)/power/
	
	$(FONTSDIR)/power/install.sh
	$(FONTSDIR)/nerd/install.sh

.PHONY: vundle
vundle:
	$(CLONE) https://github.com/VundleVim/Vundle.vim.git $(HOME)/.vim/bundle/Vundle.vim
	vim
