call plug#begin('~/.vim/plugged')
"
"---------------
"--- Utility ---
"---------------

Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'scrooloose/nerdcommenter'
Plug 'Chiel92/vim-autoformat'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mattn/emmet-vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim' " Required by telescope
Plug 'nvim-telescope/telescope.nvim' " Better than fzf, amazing search

"--------------
"--- Syntax ---
"--------------

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"---------------------------------
"--- Language Server Protocol ---
"---------------------------------

Plug 'neovim/nvim-lspconfig'
Plug 'RishabhRD/popfix' " Required by lsputils
Plug 'RishabhRD/nvim-lsputils' " Enhance built in LSP functions
Plug 'hrsh7th/nvim-compe' " LSP Completion

"-----------------------
"--- Git Integration ---
"-----------------------

Plug 'airblade/vim-gitgutter'

"--------------
"--- Beauty ---
"--------------

Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'

"---------------
"--- Preview ---
"---------------

Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': ['markdown'] }


call plug#end()
