"=== Completion ===
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"=== Terminal ===
map <silent> <F2>  :Autoformat<CR>
map <silent> <F8>  :CHADopen<CR>

"=== Telescope ===
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"=== Close all buffers execept the one on focus
command! BufOnly execute '%bdelete|edit #|normal `"'
