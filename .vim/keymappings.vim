"**********  Key mapping  **********

let mapleader ="\<SPACE>"
inoremap kj <ESC>
"Press Enter after search to remove hightlight
nnoremap <silent> <CR> :nohlsearch <CR>

"A small script to enable Metakey(Alt)
for i in range(97,122)
    let c=nr2char(i)
    exec "map \e".c." <M-".c.">"
    exec "map! \e".c." <M-".c.">"
endfor
"Go to the beginning of a line
nnoremap <C-a> <ESC>^
inoremap <C-a> <ESC>^
vnoremap <C-a> ^
"Go to the end of a line
nnoremap <M-a> <ESC>$
inoremap <M-a> <ESC>$
vnoremap <M-a> $
"Switching panels
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
"Faster scrolling
nnoremap J 10j
nnoremap K 10k
vnoremap J 10j
vnoremap K 10k
"Enable saving edited file that needs root privilage before opening
cmap w!! w !sudo tee % >/dev/null

"**********  Plugin mapping  **********

"""YouCompleteMe"""
"Let g:ycm_key_list_stop_completion=['<C-TAB>']
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""NerdTree"""
map <C-e> :NERDTreeToggle<CR>

"""EasyMotion"""
let g:EasyMotion_do_mapping=0 "Disable default mapping"
"Might change to just <Leader> for easier pressing, this is in case it messes with compability with other plugins
let g:EasyMotion_smartcase=1
map  <Leader><Leader>  <Plug>(easymotion-prefix)
nmap <Leader><Leader>s <Plug>(easymotion-sn)
nmap <Leader><Leader>S <Plug>(easymotion-overwin-f2)
map  <Leader><Leader>l <Plug>(easymotion-lineforward)
map  <Leader><Leader>h <Plug>(easymotion-linebackward)
map  <Leader><Leader>j <Plug>(easymotion-j)
map  <Leader><Leader>k <Plug>(easymotion-k)
map  <Leader><Leader>w <Plug>(easymotion-w)
map  <Leader><Leader>b <Plug>(easymotion-b)

"""UndoTree"""
nnoremap <F3> :UndotreeToggle<CR>

"""Vim-Airline"""
" Use Meta (Alt) key to switch. Some terminals like WSL read Alt+1 as <Esc>1
nmap <Esc>1 <Plug>AirlineSelectTab1
nmap <Esc>2 <Plug>AirlineSelectTab2
nmap <Esc>3 <Plug>AirlineSelectTab3
nmap <Esc>4 <Plug>AirlineSelectTab4
nmap <Esc>5 <Plug>AirlineSelectTab5
nmap <Esc>6 <Plug>AirlineSelectTab6
nmap <Esc>7 <Plug>AirlineSelectTab7
nmap <Esc>8 <Plug>AirlineSelectTab8
nmap <Esc>9 <Plug>AirlineSelectTab9

" Uncomment these to use on a terminal that can read Meta (Alt) properly
" nmap <M-1> <Plug>AirlineSelectTab1
" nmap <M-2> <Plug>AirlineSelectTab2
" nmap <M-3> <Plug>AirlineSelectTab3
" nmap <A-4> <Plug>AirlineSelectTab4
" nmap <A-5> <Plug>AirlineSelectTab5
" nmap <A-6> <Plug>AirlineSelectTab6
" nmap <A-7> <Plug>AirlineSelectTab7
" nmap <A-8> <Plug>AirlineSelectTab8
" nmap <A-9> <Plug>AirlineSelectTab9

