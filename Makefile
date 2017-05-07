.PHONY: dotfiles
	ln -f vimrc ~/.vimrc
	ln -f inputrc ~/.inputrc
	ln -f gitconfig ~/.gitconfig
	ln -f bashrc ~/.bashrc
	ln -f tmux.conf ~/.tmux.conf

.PHONY: fonts
	git clone https://github.com/ryanoasis/nerd-fonts ~/.customfonts
	git clone https://github.com/powerline/fonts ~/.customfonts/
	
	~/.customfonts/fonts/install.sh
	~/.customfonts/nerd-fonts/install.sh

.PHONY: vundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

.PHONY: neovim
	mkdir ~/.config/nvim
	ln -f init.vim ~/.config/nvim/init.vim
	
