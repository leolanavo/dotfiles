# Directories
NVIMDIR  := $(HOME)/.config/nvim
FONTSDIR := $(HOME)/.customfonts
VIMDIR   := $(HOME)/.vim 
I3DIR    := $(HOME)/.config/i3
PWD      := $(shell pwd)
PWDI3	 := $(patsubst %, %/i3, $(PWD))

# Commands
LINK	 := ln -sf
CLONE    := git clone
RMDIR    := rm -rf
RM		 := rm -f

# Dependencies
NVIM     := init.vim
I3		 := config i3blocks.conf
FILES 	 := vimrc inputrc bashrc tmux.conf gitconfig zshrc

# Targets
NVIMFILES := $(patsubst %, $(NVIMDIR)/%, $(NVIM))
I3FILES  := $(patsubst %, $(I3DIR)/%, $(I3))
DOTFILES := $(patsubst %, $(HOME)/.%, $(FILES))

$(NVIMDIR) $(I3DIR) $(FONTSDIR):
	mkdir -p $@

.PHONY: dotfiles
dotfiles: $(DOTFILES) $(NVIMFILES) $(I3FILES) 

$(HOME)/.%: $(PWD)/%
	$(LINK) $^ $@

$(I3DIR)/%: $(PWDI3)/% | $(I3DIR)
	$(LINK) $^ $@

$(NVIMFILES): $(NVIM) | $(NVIMDIR)
	$(LINK) $^ $@

.PHONY: zsh
zsh:
	$(RMDIR) $(HOME)/.oh-my-zsh
	wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -
	bash install.sh
	$(RM) install.sh
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

.PHONY: fonts
fonts: $(FONTSDIR)
	$(CLONE) https://github.com/ryanoasis/nerd-fonts $(FONTSDIR)/nerd/
	$(CLONE) https://github.com/powerline/fonts $(FONTSDIR)/power/
	$(FONTSDIR)/power/install.sh
	$(FONTSDIR)/nerd/install.sh

.PHONY: vundle
vundle:
	$(CLONE) https://github.com/VundleVim/Vundle.vim.git $(HOME)/.vim/bundle/Vundle.vim
