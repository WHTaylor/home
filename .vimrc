inoremap jk <ESC>
let mapleader = " "

colo ron

set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set autoindent

nnoremap <leader>b :ls<CR>:buffer<Space>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>h :set hlsearch! hlsearch?<CR>
nnoremap <leader>s :e scratch<CR>
nnoremap <leader>r :%s/

command! Wq wq

autocmd FileType javascript inoremap <buffer> ;p console.log();<Left>
autocmd FileType python     inoremap <buffer> ;p print()<Left>
