"=== Completion ===
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"=== Terminal ===
map <silent> <F2>  :Autoformat<CR>
map <silent> <F8>  :CHADopen<CR>

nmap <c-/> :BufOnly<cr>

"=== Telescope ===
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope git_branches<cr>
nnoremap <leader>fh <cmd>Telescope marks<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fz <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fw <cmd>Telescope grep_string<cr>
nnoremap <leader>fs <cmd>Telescope git_status<cr>

"=== Close all buffers execept the one on focus
command! BufOnly execute '%bdelete|edit #|normal `"'
map <silent> <C-b> :BufOnly<CR>

"=== Quickfix list navigation ===
map <C-j> :cn<CR>
map <C-p> :cp<CR>
map <silent> <C-l> :ClearQF<cr>
command! ClearQF execute 'cexpr [] | ccl'
