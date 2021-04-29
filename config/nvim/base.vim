filetype plugin on

"=== Interface options ===

set number
set relativenumber
set cursorline
set scrolloff=5
set laststatus=2
set list
set listchars=tab:\>\ 

"=== Search options ===

set hlsearch
set incsearch
set ignorecase
set smartcase

"=== Substitute options ===

set gdefault

"=== Input options ===

set mouse=a

"=== Pane options ===

set splitbelow
set splitright

"=== Identation options ===

set wrap
set linebreak
set breakindent
set autoindent
set smarttab

set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=80

"=== File options ===

set autoread
set updatetime=250

au FileType json set conceallevel=0

"=== Fold options ===

set foldenable
set foldmethod=marker

"=== Format options ===

set formatoptions+=l
set formatoptions-=t

"=== Completion options ===

set completeopt=menuone,noinsert,noselect,preview

"=== Other options ===
" Avoid showing message extra message when using completion
set shortmess+=c

" Highlight from start of file
autocmd BufEnter * :syntax sync fromstart

set clipboard+=unnamedplus
set fileencoding=utf-8

let g:html_indent_inctags = "html,body,head,tbody,div"

" Remember cursor pos
autocmd BufReadPost *
  \  if line("'\"") > 1 && line("'\"") <= line("$") |
  \    exe "normal! g`\"" |
  \  endif

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:vimsyn_embed = "lPr"
let g:tex_conceal=0
