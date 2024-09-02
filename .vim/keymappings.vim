"**********  Key mapping  **********

let mapleader ="\<SPACE>"
inoremap kj <ESC>
nnoremap <silent> <Leader>nl :nohlsearch <CR>

" A small script to enable Metakey(Alt)
for i in range(97,122)
    let c=nr2char(i)
    exec "map \e".c." <M-".c.">"
    exec "map! \e".c." <M-".c.">"
endfor

" Go to the beginning of a line
nnoremap <C-a> <ESC>0
inoremap <C-a> <ESC>0
vnoremap <C-a> ^
" Go to the end of a line
nnoremap <M-a> <ESC>$
inoremap <M-a> <ESC>$
vnoremap <M-a> $
" Switching panels
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
" Faster scrolling
nnoremap J 10j
nnoremap K 10k
vnoremap J 10j
vnoremap K 10k
" Buffers
nnoremap <Tab>   :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <C-W>x  :bd<CR>

" Enable saving edited file that needs root privilage before opening
cmap w!! w !sudo tee % >/dev/null

" Enable shifting line up/down
nnoremap <C-S-up>   :m -2<CR>
vnoremap <C-S-up>   :m -2<CR>
nnoremap <C-S-down> :m +1<CR>
vnoremap <C-S-down> :m +1<CR>

" Enable Shift+Tab
inoremap <S-Tab> <C-d>

