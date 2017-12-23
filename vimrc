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

set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')

"===================
"=== Plugin List ===
"===================

"---------------
"--- Testing ---
"---------------

Plug 'jceb/vim-orgmode'
Plug 'dkprice/vim-easygrep'
Plug 'haya14busa/incsearch.vim'

"---------------
"--- Utility ---
"---------------

Plug 'mattn/emmet-vim'
Plug 'danro/rename.vim'
Plug 'reedes/vim-wheel'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'wesQ3/vim-windowswap'
Plug 'mklabs/split-term.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace'

"---------------------
"--- Code Checking ---
"---------------------

Plug 'scrooloose/syntastic'
Plug 'vim-scripts/Conque-GDB'

"-----------------
"--- Languages ---
"-----------------

Plug 'udalov/kotlin-vim'

"-----------------------
"--- Git Integration ---
"-----------------------

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"--------------
"--- Beauty ---
"--------------

Plug 'bling/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'jakedouglas/exuberant-ctags'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline-themes'

"-------------
"--- Latex ---
"-------------

Plug 'donRaphaco/neotex', { 'for': 'tex' }

"---------------------
"--- Auto Complete ---
"---------------------
Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'artur-shaik/vim-javacomplete2'
Plug 'poppyschmo/deoplete-latex'


call plug#end()            " required
filetype plugin indent on    " required

"#######################
"### General Options ###
"#######################

"########################
"### Mappings Options ###
"########################

map <silent> <C-g> :10Term<CR>
map <silent> <F2>  :Autoformat<CR>
map <C-s>          :SyntasticToggleMode<CR>
map <silent> <F9>  :TagbarToggle<CR>
map <silent> <F8>  :NERDTreeToggle<CR>
map <silent> <C-G> :GitGutterToggle<CR>
map <silent> <C-l> :NeoTexOn<CR>

"=== Normal Mappings ===
nmap <silent> mv      :vertical resize 83<CR>
nmap <silent> mh      :resize 23<CR>
nmap <silent> <TAB>   gt
nmap <silent> <S-TAB> :w<CR>:tabclose<CR>

"=========================
"=== Interface Options ===
"=========================

set number
set mouse=a
set cursorline
set splitbelow
set splitright
set updatetime=250
let g:tex_conceal=0

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

au BufNewFile,BufRead *.rkt,*.html set tabstop=2
au BufNewFile,BufRead *.rkt,*.html set softtabstop=2
au BufNewFile,BufRead *.rkt,*.html set shiftwidth=2
au BufNewFile,BufRead *.rkt,*.html,*.txt set textwidth=120

"========================
"=== Coloring Options ===
"========================

if has("nvim")
    set termguicolors
endif

set t_Co=256 "Enable the terminal to recognize 256 colors
set background=dark

let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#AA0000'
let g:terminal_color_2  = '#00AA00'
let g:terminal_color_3  = '#AA5500'
let g:terminal_color_4  = '#0000AA'
let g:terminal_color_5  = '#AA00AA'
let g:terminal_color_6  = '#00AAAA'
let g:terminal_color_7  = '#AAAAAA'
let g:terminal_color_8  = '#555555'
let g:terminal_color_9  = '#FF5555'
let g:terminal_color_10 = '#55FF55'
let g:terminal_color_11 = '#FFFF55'
let g:terminal_color_12 = '#5555FF'
let g:terminal_color_13 = '#FF55FF'
let g:terminal_color_14 = '#55FFFF'
let g:terminal_color_15 = '#FFFFFF'

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

"========================
""=== Deoplete options ===
"========================

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set completeopt-=preview

let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 10

let g:deoplete#sources#clang#libclang_path = '/lib/llvm/build/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/lib/llvm/build/lib/clang'
let g:deoplete#sources#clang#flags = ["-Iinclude"]

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

"=========================
"=== GitGutter Options ===
"=========================

let g:gitgutter_sign_added = '⊕'
let g:gitgutter_sign_modified = '⊘'
let g:gitgutter_sign_removed = '⊗'
let g:gitgutter_sign_removed_first_line = '⊙'
let g:gitgutter_sign_modified_removed = '⊖'

"===========================
"=== Indent Line options ===
"===========================

let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '¦'

"===========================
"=== White Space options ===
"===========================

autocmd BufEnter * EnableStripWhitespaceOnSave

"=======================
"=== Rainbow options ===
"=======================

let g:rainbow_active = 1
let g:raibow_conf = {
        \   'ctermfgs': [171, 126, 33, 202],
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

"=========================
"=== Syntastic options ===
"=========================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_c_include_dirs = ['include']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 7
let g:syntastic_error_symbol = '☠'
let g:syntastic_warning_symbol = '⚠'

let g:syntastic_enable_racket_racket_checker = 1

"=======================
"=== Airline Options ===
"=======================

let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

let g:airline_detect_crypt = 0
let g:airline_detect_spell = 0

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

"==================
"=== Popup Menu ===
"==================

hi Pmenu      guifg=#F8F8F8 guibg=#000000 gui=NONE ctermfg=15  ctermbg=232  cterm=NONE
hi PmenuSet   guifg=#66D9EF guibg=#111111 gui=NONE ctermfg=81  ctermbg=233 cterm=NONE
hi PmenuSBar  guifg=#66D9EF guibg=#334455 gui=NONE ctermfg=81  ctermbg=59  cterm=NONE
hi PmenuSel   guifg=#66D9EF guibg=#334455 gui=NONE ctermfg=81  ctermbg=59  cterm=NONE
hi PmenuThumb guifg=#778899 guibg=#778899 gui=NONE ctermfg=103 ctermbg=103 cterm=NONE

"==============
"=== Editor ===
"==============

hi Normal       guifg=#F8F8F2 guibg=#111111 gui=NONE ctermfg=15   ctermbg=233  cterm=bold
hi Conceal      guifg=#66D9EF guibg=#111111 gui=NONE ctermfg=81   ctermbg=233  cterm=NONE
hi NonText      guifg=#49483E guibg=NONE    gui=NONE ctermfg=59   ctermbg=NONE cterm=NONE
hi StatusLine   guifg=#66D9EF guibg=#111111 gui=NONE ctermfg=81   ctermbg=233  cterm=NONE
hi StatusLineNC guifg=#778899 guibg=#111111 gui=NONE ctermfg=103  ctermbg=233  cterm=NONE
hi Search       guifg=#000000 guibg=#FFE972 gui=NONE ctermfg=00   ctermbg=221  cterm=NONE
hi VertSplit    guifg=#666666 guibg=#666666 gui=NONE ctermfg=95   ctermbg=NONE cterm=NONE
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
hi MatchParen   guifg=#F8F8F2 guibg=#9900CC gui=NONE ctermfg=244  ctermbg=007 cterm=NONE

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
