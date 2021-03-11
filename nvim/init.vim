set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let g:custom_path = '~/.config/nvim/'

func LoadConfig(name)
    exec 'source' g:custom_path . a:name . '.vim'
endfunc

call LoadConfig('base')
call LoadConfig('plugins')
call LoadConfig('colors')
call LoadConfig('keymap')
call LoadConfig('plugins-config')

source ~/.vimrc

