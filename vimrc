"****************************
"*** NeoVim Configuration ***
"****************************

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

"--------------
"--- Vundle ---
"--------------

Plugin 'VundleVim/Vundle.vim'

"---------------
"--- Utility ---
"---------------

Plugin 'danro/rename.vim'
Plugin 'reedes/vim-wheel'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'luochen1990/rainbow'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'wesq3/vim-windowswap'
Plugin 'mklabs/split-term.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'

"---------------------
"--- Code Checking ---
"---------------------

Plugin 'Conque-GDB'
Plugin 'scrooloose/syntastic'

"-----------------------
"--- Git Integration ---
"-----------------------

Plugin 'tpope/vim-fugitive'

"--------------
"--- Beauty ---
"--------------

Plugin 'bling/vim-airline'
Plugin 'sheerun/vim-polyglot'
Plugin 'ryanoasis/vim-devicons' 
Plugin 'jakedouglas/exuberant-ctags'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline-themes'

"---------------------
"--- Auto Complete ---
"---------------------

Plugin 'zchee/deoplete-clang'
Plugin 'zchee/deoplete-jedi'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/neoinclude.vim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'poppyschmo/deoplete-latex'

call vundle#end()            " required
filetype plugin indent on    " required

"#######################
"### General Options ###
"#######################

"########################
"### Mappings Options ###
"########################

map <silent> <F8> :NERDTreeToggle<CR>
map <silent> <F9> :TagbarToggle<CR>
map <silent> <C-g> :10Term<CR>
map <C-s> :SyntasticToggleMode<CR>
map <silent> <F2> :Autoformat<CR>

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

let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'


"########################
"### Plugin's Options ###
"########################

"======================
"=== Syntax Options ===
"======================

if has("syntax")
    syntax on
    filetype on
    au BufNewFile,BufRead *.jq set filetype=javascript
endif

"==========================
"=== Autoformat Options ===
"==========================

"========================
"=== Deoplete options ===
"========================

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/lib/llvm/build/lib/libclang.so' 
let g:deoplete#sources#clang#clang_header = '/lib/llvm/build/lib/clang'

autocmd FileType *.java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_LibsPath = '~/Programação/MAC323/algs4.jar'

"=======================
"=== Tagbar options  ===
"=======================

let g:tagbar_autoclose = 0
let g:tagbar_width = 30

"==========================
"=== Split-Term options ===
"==========================

set splitbelow

"===========================
"=== Indent Line options ===
"===========================

let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '¦'

"=======================
"=== Rainbow options ===
"=======================

let g:rainbow_active = 1
let g:raibow_conf = {
        \   'ctermfgs': [28, 126, 33, 202],
        \}


"=========================
"=== Vim-Wheel options ===
"=========================

let g:wheel#map#mouse = 1

"================================
"=== Multiple Cursors options ===
"================================

let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"===========================
"=== Window Swap options ===
"===========================

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <F5> :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <F6> :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <F7> :call WindowSwap#EasyWindowSwap()<CR>

"=========================
"=== Syntastic options ===
"=========================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 7
let g:syntastic_error_symbol = '☠'
let g:syntastic_warning_symbol = '⚠'

"=======================
"=== Airline Options ===
"=======================

let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

"==============================
"=== NERDCommenter Options ===
"==============================

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

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

hi Cursor       guifg=#000000       guibg=#ffff99       gui=NONE
hi CursorIM     guifg=#000000       guibg=#aaccff       gui=NONE
hi CursorLine   guifg=#33CC33       guibg=#1b1b1b       gui=NONE
hi CursorColumn guifg=NONE          guibg=#1b1b1b       gui=NONE

hi Visual       guifg=NONE			guibg=#344863       gui=NONE
hi IncSearch    guifg=#000000       guibg=#eedd33       gui=bold
hi Search       guifg=#efefd0       guibg=#A80F2B       gui=NONE
hi MatchParen   guifg=#FFC124       guibg=#47360A       gui=bold

hi ModeMsg      guifg=#eecc18       guibg=NONE          gui=NONE
hi Title        guifg=#dd4452       guibg=NONE          gui=bold
hi Question     guifg=#66d077       guibg=NONE          gui=NONE
hi MoreMsg      guifg=#39d049       guibg=NONE          gui=NONE
hi ErrorMsg     guifg=#ffffff       guibg=#ff0000       gui=bold
hi WarningMsg   guifg=#ccae22       guibg=NONE          gui=bold
hi Comment      guifg=#408000       guibg=NONE          gui=NONE

hi Constant     guifg=#F34AFF       guibg=NONE          gui=NONE
hi String       guifg=#4D63EB		guibg=NONE			gui=NONE
hi Character	guifg=orange		guibg=NONE          gui=bold
hi Boolean		guifg=#F34AFF       guibg=NONE          gui=bold

hi PreProc      guifg=#9FEF47       guibg=NONE          gui=NONE
hi Include      guifg=#B3B300       guibg=NONE          gui=NONE

hi Type         guifg=#47ABF0       guibg=NONE          gui=bold
hi Typedef      guifg=#ff9933       guibg=NONE          gui=bold

hi Statement    guifg=#47ABF0       guibg=NONE          gui=bold
hi Operator     guifg=#EC2417       guibg=NONE          gui=NONE
hi Function     guifg=#6666FF       guibg=NONE          gui=NONE
hi Repeat       guifg=#3333FF       guibg=NONE          gui=NONE
hi Identifier   guifg=#33CC33       guibg=NONE          gui=NONE

hi Special      guifg=#83E683		guibg=NONE          gui=bold
hi SpecialChar	guifg=orange		guibg=NONE          gui=bold
hi Delimiter	guifg=orange		guibg=NONE          gui=bold

hi Underlined   guifg=#80a0ff       guibg=NONE          gui=underline
hi Ignore       guifg=#888888       guibg=NONE          gui=NONE
hi Error        guifg=#ffffff       guibg=#ff0000       gui=NONE
hi Todo         guifg=#ffffff       guibg=#ee7700       gui=bold


