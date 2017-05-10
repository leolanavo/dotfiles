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

$(NVIMDIR):
	mkdir -p $@

.PHONY: dotfiles
dotfiles: $(DOTFILES) $(INITNVIM)

$(HOME)/.%: $(PWD)/%
	$(LINK) $< $@

.PHONY: nvim
nvim: $(INITNVIM)

$(INITNVIM): $(NVIMDIR)
	$(LINK) $(PWD)/$(NVIM) $@

.PHONY: fonts
fonts: | $(FONTSDIR)
	$(CLONE) https://github.com/ryanoasis/nerd-fonts $(FONTSDIR)
	$(CLONE) https://github.com/powerline/fonts $(FONTSDIR)
	
	$(FONTSDIR)/fonts/install.sh
	$(FONTSDIR)/nerd-fonts/install.sh

.PHONY: vundle
vundle:
	$(CLONE) https://github.com/VundleVim/Vundle.vim.git $(VIMDIR)/bundle/Vundle.vim
