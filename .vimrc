inoremap jk <ESC>
let mapleader = " "

colo ron
set hlsearch
set number relativenumber
set lazyredraw

"Indentation
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set autoindent
set ignorecase smartcase "Ignore case unless pattern includes capitals

"Pane movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Shortcuts
nnoremap <leader>b :ls<CR>:buffer<Space>
nnoremap <leader>h :set hlsearch! hlsearch?<CR>
nnoremap <leader>t :e ~/todo<CR>
nnoremap <leader>s :%s/
nnoremap <F2> :bnext<CR>
nnoremap <F3> :bprev<CR>
nnoremap <leader>e :Explore<CR>

"Typo helper
command! Wq wq

"Abbreviations
inoreabbrev sadface ʘ︵ʘ

"Paste block into terminal repl. Only works with a single split, and keeps
"indentation so sometimes annoying for python, but simple
vnoremap <leader>p "ry<c-w>w<c-w>"r<c-w>w
