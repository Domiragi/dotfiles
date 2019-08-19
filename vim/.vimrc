set nocp

execute pathogen#infect()

" keys remap
inoremap kj <ESC>
let mapleader = "z"

"set behaviours
set nocompatible
filetype plugin indent on 
syntax on 
set encoding=utf-8
set modelines=0
set tabstop =4
set shiftwidth =4
set softtabstop =4
set autoindent
set showmode
set visualbell
set ttyfast
set laststatus =2
set number

"visual settings
colorscheme onedark

" windows navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
