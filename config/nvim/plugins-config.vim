"=== Nvim LSP Config ===
exec 'luafile' expand(g:custom_path . 'lua/lsp-config.lua')
autocmd VimEnter * :COQnow

"=== Nvim Compe ===
"exec 'luafile' expand(g:custom_path . 'lua/nvim-compe.lua')

"=== Telescope ===
exec 'luafile' expand(g:custom_path . 'lua/telescope-nvim.lua')

"=== TreeSitter ===
exec 'luafile' expand(g:custom_path . 'lua/treesitter.lua')

"=== GitGutter Options ===

let g:gitgutter_sign_added = '⊕'
let g:gitgutter_sign_modified = '⊘'
let g:gitgutter_sign_removed = '⊗'
let g:gitgutter_sign_removed_first_line = '⊙'
let g:gitgutter_sign_modified_removed = '⊖'

"=== lightline ===

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['gitbranch', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'gitbranch#name',
      \ },
    \ }

function! LightlineFilename()
  return expand('%')
endfunction

"=== Indent Line options ===

autocmd FileType markdown let g:indentLine_enabled=0
autocmd FileType json let g:indentLine_enabled=0
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '|'

"=== White Space options ===

autocmd BufEnter * EnableStripWhitespaceOnSave

"=== NERDCommenter Options ===

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

"=== Glow Options ===

