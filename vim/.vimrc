set nocp

execute pathogen#infect()

inoremap kj <ESC>
let mapleader=" "
set nocompatible
filetype plugin indent on 
syntax on 
set encoding=utf-8

"visual settings
colorscheme onedark

" windows navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
