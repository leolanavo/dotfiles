call plug#begin('~/.vim/plugged')
"
"---------------
"--- Utility ---
"---------------

Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'Chiel92/vim-autoformat'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mattn/emmet-vim'

"-- Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

"-- Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
"-- Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'nvim-lua/plenary.nvim' "Required by telescope
Plug 'nvim-telescope/telescope.nvim' "Better than fzf, amazing search
Plug 'nvim-telescope/telescope-fzy-native.nvim'

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
"Plug 'hrsh7th/nvim-compe' " LSP Completion

"-----------------------
"--- Git Integration ---
"-----------------------

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'

"--------------
"--- Beauty ---
"--------------

Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'

"---------------
"--- Preview ---
"---------------

Plug 'ellisonleao/glow.nvim'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

call plug#end()
