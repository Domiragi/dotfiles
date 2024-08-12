"**********  Plugin mapping  **********

"""NerdCommenter"""
vnoremap <Leader>cc <plug>NERDCommenterToggle
vnoremap <Leader>cb <plug>NERDCommenterSexy
vnoremap <Leader>cu <plug>NERDCommenterUncomment

"""NerdTree"""
nnoremap <C-e> :NERDTreeToggle<CR>

"""WhiteSpace"""
let g:better_whitespace_operator = ""

"""EasyMotion"""
nmap <Leader>s <Plug>(easymotion-sn)
xmap <Leader>s <Plug>(easymotion-sn)
nmap <Leader>S <Plug>(easymotion-sl)
xmap <Leader>S <Plug>(easymotion-sl)
nmap <Leader>h <Plug>(easymotion-linebackward)
xmap <Leader>h <Plug>(easymotion-linebackward)
nmap <Leader>l <Plug>(easymotion-lineforward)
xmap <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>j <Plug>(easymotion-j)
xmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
xmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>w <Plug>(easymotion-w)
xmap <Leader>w <Plug>(easymotion-w)
nmap <Leader>b <Plug>(easymotion-b)
xmap <Leader>b <Plug>(easymotion-b)
nmap <Leader>e <Plug>(easymotion-e)
xmap <Leader>e <Plug>(easymotion-e)

"""EasyAlign"""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"""UndoTree"""
nnoremap <F3> :UndotreeToggle<CR>

"""Vim-Airline"""
function! SetVimAirlineMapping()
    if has("unix")
        let lines = readfile("/proc/version")
        if lines[0] =~ "Microsoft" || lines[0] =~ "microsoft"
            " Use Meta(Alt) key to switch. WSL reads Alt+1 as <Esc>1 ("^[1")
            nmap <Esc>1 <Plug>AirlineSelectTab1
            nmap <Esc>2 <Plug>AirlineSelectTab2
            nmap <Esc>3 <Plug>AirlineSelectTab3
            nmap <Esc>4 <Plug>AirlineSelectTab4
            nmap <Esc>5 <Plug>AirlineSelectTab5
            nmap <Esc>6 <Plug>AirlineSelectTab6
            nmap <Esc>7 <Plug>AirlineSelectTab7
            nmap <Esc>8 <Plug>AirlineSelectTab8
            nmap <Esc>9 <Plug>AirlineSelectTab9
        else
            nmap <M-1> <Plug>AirlineSelectTab1
            nmap <M-2> <Plug>AirlineSelectTab2
            nmap <M-3> <Plug>AirlineSelectTab3
            nmap <A-4> <Plug>AirlineSelectTab4
            nmap <A-5> <Plug>AirlineSelectTab5
            nmap <A-6> <Plug>AirlineSelectTab6
            nmap <A-7> <Plug>AirlineSelectTab7
            nmap <A-8> <Plug>AirlineSelectTab8
            nmap <A-9> <Plug>AirlineSelectTab9
        endif
    endif
endfunction

"""OSCYank"""
vmap <Leader>yy <Plug>OSCYankVisual

"""YouCompleteMe"""
" Let g:ycm_key_list_stop_completion=['<C-TAB>']
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

