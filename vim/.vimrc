set nocp

execute pathogen#infect()

" keys remap
inoremap kj <ESC>
let mapleader = "z"

" settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" open nerdtree browser
map <F10> :NERDTreeToggle<CR>
" close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
set cul


"visual settings
colorscheme onedark

" windows navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
