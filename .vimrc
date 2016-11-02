"*************************
"*** Vim Configuration ***
"*************************

"|--------------------------|
"|SUBTITLE:                 |
"|      # --> Chapters      |
"|      = --> Sections      |
"|      - --> Subsections   |
"|--------------------------|

"###############
"### Plugins ###
"###############

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"===================
"=== Plugin List ===
"===================

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'wincent/command-t'
Plugin 'Conque-GDB'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

"#######################
"### General Options ###
"#######################

"=========================
"=== Interface Options ===
"=========================

set number
set mouse=a

"==========================
"=== Identation Options ===
"==========================

set wrap
set linebreak
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set autoindent

"========================
"=== Coloring Options ===
"========================

set t_Co=256 "Enable the terminal to recognize 256 colors
set background=dark

"======================
"=== Syntax Options ===
"======================

if has("syntax")
    syntax on
    filetype on
    au BufNewFile,BufRead *.jq set filetype=javascript
endif

"########################
"### Plugin's Options ###
"########################

"===========================
"=== Colorscheme options ===
"===========================

colorscheme codeblocks_dark

"=========================
"=== Syntastic options ===
"=========================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"-------------------------
"--- Compilation Flags ---
"-------------------------
" Just leave one of these uncommented

"MAC0216 flags
"let g:syntastic_c_compiler_options = '-Wall -std=c99 -O2'

"MAC121 flags
let g:syntastic_c_compiler_options = '-Wall -ansi -pendantic -O2' 

"=======================
"=== Airline Options ===
"=======================

let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

"========================
"=== NerdTree Options ===
"========================

autocmd VimEnter * NERDTree

