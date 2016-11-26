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
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'reedes/vim-wheel'
Plugin 'danro/rename.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
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

set termguicolors
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

"=========================
"=== Syntastic options ===
"=========================

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"-------------------------
"--- Compilation Flags ---
"-------------------------
" Just leave one of these uncommented

"MAC0216 flags
"let g:syntastic_c_compiler_options = '-Wall -std=c99'

"MAC121 flags
"let g:syntastic_c_compiler_options = '-Wall -ansi -pendantic' 

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
let g:NERDTreeWinPos = "right"

"#####################
"### Theme Options ###
"#####################

hi Normal       guifg=#D1D1D1       guibg=#121316       gui=NONE

hi Folded       guifg=#c2bfa5       guibg=#050505       gui=underline
hi LineNr		guifg=#FF0000		guibg=#0B0B0D		gui=NONE
hi Directory    guifg=#00bbdd       guibg=NONE          gui=bold
hi NonText      guifg=#77ff22       guibg=NONE          gui=bold
hi SpecialKey   guifg=#559933       guibg=NONE          gui=NONE

hi SpellBad     guifg=NONE          guibg=NONE          gui=undercurl
hi SpellCap     guifg=NONE          guibg=NONE          gui=undercurl
hi SpellLocal   guifg=NONE          guibg=NONE          gui=undercurl
hi SpellRare    guifg=NONE          guibg=NONE          gui=undercurl

hi DiffAdd      guifg=#ffffff       guibg=#126493       gui=NONE
hi DiffChange   guifg=#000000       guibg=#976398       gui=NONE
hi DiffDelete   guifg=#000000       guibg=#be1923       gui=bold
hi DiffText     guifg=#ffffff       guibg=#976398       gui=bold
" }}}

" borders / separators / menus {{{
hi FoldColumn   guifg=#c8bcb9       guibg=#786d65       gui=bold
hi SignColumn   guifg=#c8bcb9       guibg=#786d65       gui=bold

hi Pmenu        guifg=#000000       guibg=#a6a190       gui=NONE
hi PmenuSel     guifg=#ffffff       guibg=#133293       gui=NONE
hi PmenuSbar    guifg=NONE          guibg=#555555       gui=NONE
hi PmenuThumb   guifg=NONE          guibg=#cccccc       gui=NONE

hi StatusLine   guifg=#000000       guibg=#c2bfa5       gui=bold
hi StatusLineNC guifg=#444444       guibg=#c2bfa5       gui=NONE
hi WildMenu     guifg=#ffffff       guibg=#133293       gui=bold
hi VertSplit    guifg=#c2bfa5       guibg=#c2bfa5       gui=NONE

hi TabLine      guifg=#000000       guibg=#c2bfa5       gui=NONE
hi TabLineFill  guifg=#000000       guibg=#c2bfa5       gui=NONE
hi TabLineSel   guifg=#ffffff       guibg=#133293       gui=NONE

"hi Menu
"hi Scrollbar
"hi Tooltip
" }}}

" cursor / dynamic / other {{{
hi Cursor       guifg=#000000       guibg=#ffff99       gui=NONE
hi CursorIM     guifg=#000000       guibg=#aaccff       gui=NONE
hi CursorLine   guifg=#33CC33       guibg=#1b1b1b       gui=NONE
hi CursorColumn guifg=NONE          guibg=#1b1b1b       gui=NONE

hi Visual       guifg=NONE			guibg=#344863       gui=NONE
hi IncSearch    guifg=#000000       guibg=#eedd33       gui=bold
hi Search       guifg=#efefd0       guibg=#A80F2B       gui=NONE
hi MatchParen   guifg=#FFC124       guibg=#47360A       gui=bold

"hi VisualNOS
" }}}

" listings / messages {{{
hi ModeMsg      guifg=#eecc18       guibg=NONE          gui=NONE
hi Title        guifg=#dd4452       guibg=NONE          gui=bold
hi Question     guifg=#66d077       guibg=NONE          gui=NONE
hi MoreMsg      guifg=#39d049       guibg=NONE          gui=NONE
hi ErrorMsg     guifg=#ffffff       guibg=#ff0000       gui=bold
hi WarningMsg   guifg=#ccae22       guibg=NONE          gui=bold
" }}}

" }}}

" syntax highlighting groups {{{
"*Comment	any comment
hi Comment      guifg=#408000       guibg=NONE          gui=NONE

"*Constant		any constant
" String		a string constant
" Character		a character constant: 'c', '\n'
" Number		a number constant: 234, 0xff
" Boolean		a boolean constant: TRUE, false
" Float			a floating point constant: 2.3e10
hi Constant     guifg=#F34AFF       guibg=NONE          gui=NONE
hi String       guifg=#4D63EB		guibg=NONE			gui=NONE
hi Character	guifg=orange		guibg=NONE          gui=bold
hi Boolean		guifg=#F34AFF       guibg=NONE          gui=bold

"*PreProc		generic
" Include		preprocessor #include
" Define		preprocessor #define
" Macro			same as Define
" PreCondit		preprocessor #if, #else, #endif, etc.
hi PreProc      guifg=#9FEF47       guibg=NONE          gui=NONE
hi Include      guifg=#B3B300       guibg=NONE          gui=NONE

"*Type			int, long, char, etc.
" StorageClass	static, register, volatile, etc.
" Structure		struct, union, enum, etc.
" Typedef		A typedef
hi Type         guifg=#47ABF0       guibg=NONE          gui=bold
hi Typedef      guifg=#ff9933       guibg=NONE          gui=bold

"*Identifier	any variable name
" Function		function name (also: methods for classes)

" Statement		any statement
" Conditional	if, then, else, endif, switch, etc.
" Repeat		for, do, while, etc.
" Label			case, default, etc.
" Operator		sizeof, +, *, etc.
" Keyword		any other keyword
" Exception		try, catch, throw
hi Statement    guifg=#47ABF0       guibg=NONE          gui=bold
hi Operator     guifg=#EC2417       guibg=NONE          gui=NONE
hi Function     guifg=#6666FF       guibg=NONE          gui=NONE
hi Repeat       guifg=#3333FF       guibg=NONE          gui=NONE
hi Identifier   guifg=#33CC33       guibg=NONE          gui=NONE

"*Special		any special symbol
" SpecialChar	special character in a constant
" Tag			you can use CTRL-] on this
" Delimiter		character that needs attention
" SpecialComment	special things inside a comment
" Debug			debugging statements
hi Special      guifg=#83E683		guibg=NONE          gui=bold
hi SpecialChar	guifg=orange		guibg=NONE          gui=bold
hi Delimiter	guifg=orange		guibg=NONE          gui=bold

hi Underlined   guifg=#80a0ff       guibg=NONE          gui=underline
hi Ignore       guifg=#888888       guibg=NONE          gui=NONE
hi Error        guifg=#ffffff       guibg=#ff0000       gui=NONE
hi Todo         guifg=#ffffff       guibg=#ee7700       gui=bold
" }}}
