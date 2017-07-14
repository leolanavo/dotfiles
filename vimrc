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
set cursorline

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

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="monokai-phoenix"

"==================
"=== Popup Menu ===
"==================

hi Pmenu      guifg=#F8F8F8 guibg=#223344 gui=NONE ctermfg=15  ctermbg=23  cterm=NONE
hi PmenuSet   guifg=#66D9EF guibg=#111111 gui=NONE ctermfg=81  ctermbg=233 cterm=NONE
hi PmenuSBar  guifg=#66D9EF guibg=#334455 gui=NONE ctermfg=81  ctermbg=59  cterm=NONE
hi PmenuSel   guifg=#66D9EF guibg=#334455 gui=NONE ctermfg=81  ctermbg=59  cterm=NONE
hi PmenuThumb guifg=#778899 guibg=#778899 gui=NONE ctermfg=103 ctermbg=103 cterm=NONE

"==============
"=== Editor ===
"==============

hi Normal       guifg=#F8F8F2 guibg=#111111 gui=NONE ctermfg=15   ctermbg=233  cterm=NONE
hi Conceal      guifg=#66D9EF guibg=#111111 gui=NONE ctermfg=81   ctermbg=233  cterm=NONE
hi NonText      guifg=#49483E guibg=NONE    gui=NONE ctermfg=59   ctermbg=NONE cterm=NONE
hi StatusLine   guifg=#66D9EF guibg=#111111 gui=NONE ctermfg=81   ctermbg=233  cterm=NONE
hi StatusLineNC guifg=#778899 guibg=#111111 gui=NONE ctermfg=103  ctermbg=233  cterm=NONE
hi Search       guifg=#000000 guibg=#FFE972 gui=NONE ctermfg=00   ctermbg=221  cterm=NONE
hi VertSplit    guifg=#75715E guibg=NONE    gui=NONE ctermfg=95   ctermbg=NONE cterm=NONE
hi LineNr       guifg=#8F908A guibg=NONE    gui=NONE ctermfg=102  ctermbg=NONE cterm=NONE
hi SignColumn   guifg=NONE    guibg=#211F1C gui=NONE ctermfg=NONE ctermbg=00   cterm=NONE

"================
"=== Messages ===
"================

hi Question   guifg=#E6DB74 guibg=NONE    gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi ModeMsg    guifg=#E6DB74 guibg=NONE    gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi MoreMsg    guifg=#E6DB74 guibg=NONE    gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi ErrorMsg   guifg=#111111 guibg=#F92672 gui=NONE ctermfg=233 ctermbg=197  cterm=NONE
hi WarningMsg guifg=#F92672 guibg=NONE    gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE

"================
"=== Spelling ===
"================

hi SpellBad   guifg=#F8F8F2 guibg=NONE gui=undercurl ctermfg=15 ctermbg=NONE cterm=undercurl guisp=#F92782
hi SpellLocal guifg=#66D9EF guibg=NONE gui=undercurl ctermfg=81 ctermbg=NONE cterm=undercurl guisp=#66D9EF

"================
"=== Tabline ====
"================

hi TabLine     guifg=#8F908A guibg=#111111 gui=NONE ctermfg=102 ctermbg=233 cterm=NONE
hi TabLineSel  guifg=#F8F8F2 guibg=#334455 gui=NONE ctermfg=15  ctermbg=59  cterm=NONE
hi TabLineFill guifg=#111111 guibg=#111111 gui=NONE ctermfg=233 ctermbg=233 cterm=NONE

"============
"=== Misc ===
"============

hi SpecialKey guifg=#49483E guibg=NONE gui=NONE ctermfg=59  ctermbg=NONE cterm=NONE
hi Title      guifg=#E6DB74 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi Directory  guifg=#66D9EF guibg=NONE gui=NONE ctermfg=81  ctermbg=NONE cterm=NONE

"============
"=== Diff ===
"============

hi DiffAdd    guifg=#F8F8F8 guibg=#253B22 gui=NONE ctermfg=15  ctermbg=22   cterm=NONE
hi DiffDelete guifg=#F92672 guibg=#420E09 gui=NONE ctermfg=197 ctermbg=52   cterm=NONE
hi DiffChange guifg=#E6DB74 guibg=#420E09 gui=NONE ctermfg=185 ctermbg=52   cterm=NONE
hi DiffText   guifg=#75715E guibg=NONE    gui=NONE ctermfg=95  ctermbg=NONE cterm=NONE

"===============
"=== Folding ===
"===============

hi Folded     guifg=#778899 guibg=#211F1C gui=NONE ctermfg=103  ctermbg=00 cterm=NONE
hi FoldColumn guifg=NONE    guibg=#211F1C gui=NONE ctermfg=NONE ctermbg=00 cterm=NONE

"=======================
"=== Cursor's Colors ===
"=======================

hi ColorColumn  guifg=NONE    guibg=#383A3E gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi CursorColumn guifg=NONE    guibg=#383A3E gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi CursorLine   guifg=NONE    guibg=#383A3E gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi Cursor       guifg=#111111 guibg=#F8F8F2 gui=NONE ctermfg=233  ctermbg=15  cterm=NONE
hi Visual       guifg=NONE    guibg=#49483E gui=NONE ctermfg=NONE ctermbg=59  cterm=NONE
hi MatchParen   guifg=#111111 guibg=#E6DB74 gui=NONE ctermfg=233  ctermbg=185 cterm=NONE

"=======================
"=== Neovim Terminal ===
"=======================

if has("nvim")
  hi TermCursor   guifg=#111111 guibg=#F8F8F2 gui=NONE ctermfg=233 ctermbg=15  cterm=NONE
  hi TermCursorNC guifg=#111111 guibg=#778899 gui=NONE ctermfg=233 ctermbg=103 cterm=NONE
endif

"============================
"=== General Highlighting ===
"============================

hi Constant       guifg=#AE81FF guibg=NONE    gui=NONE ctermfg=141  ctermbg=NONE cterm=NONE
hi Number         guifg=#AE81FF guibg=NONE    gui=NONE ctermfg=141  ctermbg=NONE cterm=NONE
hi Float          guifg=#AE81FF guibg=NONE    gui=NONE ctermfg=141  ctermbg=NONE cterm=NONE

hi Boolean        guifg=#AE81FF guibg=NONE    gui=NONE ctermfg=141  ctermbg=NONE cterm=NONE

hi Character      guifg=#E6DB74 guibg=NONE    gui=NONE ctermfg=185  ctermbg=NONE cterm=NONE
hi String         guifg=#E6DB74 guibg=NONE    gui=NONE ctermfg=185  ctermbg=NONE cterm=NONE

hi Type           guifg=#66D9EF guibg=NONE    gui=NONE ctermfg=81   ctermbg=NONE cterm=NONE
hi Structure      guifg=#F92782 guibg=NONE    gui=NONE ctermfg=197  ctermbg=NONE cterm=NONE
hi StorageClass   guifg=#F92782 guibg=NONE    gui=NONE ctermfg=197  ctermbg=NONE cterm=NONE
hi TypeDef        guifg=#F92782 guibg=NONE    gui=NONE ctermfg=197  ctermbg=NONE cterm=NONE
hi Identifier     guifg=#A6E22E guibg=NONE    gui=NONE ctermfg=112  ctermbg=NONE cterm=NONE
hi Function       guifg=#A6E22E guibg=NONE    gui=NONE ctermfg=112  ctermbg=NONE cterm=NONE
hi Statement      guifg=#F92782 guibg=NONE    gui=NONE ctermfg=197  ctermbg=NONE cterm=NONE
hi Operator       guifg=#F92782 guibg=NONE    gui=NONE ctermfg=197  ctermbg=NONE cterm=NONE
hi Label          guifg=#F92782 guibg=NONE    gui=NONE ctermfg=197  ctermbg=NONE cterm=NONE
hi Keyword        guifg=#66D9EF guibg=NONE    gui=NONE ctermfg=81   ctermbg=NONE cterm=NONE

hi Preproc        guifg=#A6E22E guibg=NONE    gui=NONE ctermfg=112  ctermbg=NONE cterm=NONE
hi Include        guifg=#66D9EF guibg=NONE    gui=NONE ctermfg=81   ctermbg=NONE cterm=NONE
hi Define         guifg=#66D9EF guibg=NONE    gui=NONE ctermfg=81   ctermbg=NONE cterm=NONE

hi Macro          guifg=#A6E22E guibg=NONE    gui=NONE ctermfg=112  ctermbg=NONE cterm=NONE
hi PreCondit      guifg=#A6E22E guibg=NONE    gui=NONE ctermfg=112  ctermbg=NONE cterm=NONE

hi Special        guifg=#66D9EF guibg=NONE    gui=NONE ctermfg=81   ctermbg=NONE cterm=NONE
hi SpecialChar    guifg=#F92782 guibg=NONE    gui=NONE ctermfg=197  ctermbg=NONE cterm=NONE
hi Delimiter      guifg=#F92782 guibg=NONE    gui=NONE ctermfg=197  ctermbg=NONE cterm=NONE

hi Comment        guifg=#5F87AF guibg=NONE    gui=NONE ctermfg=67   ctermbg=NONE cterm=italic
hi SpecialComment guifg=#66D9EF guibg=NONE    gui=NONE ctermfg=81   ctermbg=NONE cterm=NONE

hi Tag            guifg=#F92782 guibg=NONE    gui=NONE ctermfg=197  ctermbg=NONE cterm=NONE
hi Underlined     guifg=#A6E22E guibg=NONE    gui=NONE ctermfg=112  ctermbg=NONE cterm=NONE

hi Ignore         guifg=NONE    guibg=NONE    gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Todo           guifg=#F8F8F2 guibg=#111111 gui=bold ctermfg=15   ctermbg=233  cterm=bold
hi Error          guifg=#F8F8F2 guibg=#960020 gui=NONE ctermfg=15   ctermbg=88   cterm=NONE
