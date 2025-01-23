"------------NerdCommenter------------"

let NERDCreateDefaultMappings = 0
vnoremap <Leader>ct <plug>NERDCommenterToggle
vnoremap <Leader>cs <plug>NERDCommenterSexy
vnoremap <Leader>cu <plug>NERDCommenterUncomment

"---------------NerdTree--------------"

nnoremap <C-e> :NERDTreeToggle<CR>

"--------vim-better-whitespace--------"

let g:better_whitespace_operator = ""

"--------------EasyMotion-------------"

let g:EasyMotion_do_mapping = 0
nmap <silent> <Leader>s <Plug>(easymotion-sn)
xmap <silent> <Leader>s <Plug>(easymotion-sn)
nmap <silent> <Leader>S <Plug>(easymotion-sl)
xmap <silent> <Leader>S <Plug>(easymotion-sl)
nmap <silent> <Leader>h <Plug>(easymotion-linebackward)
xmap <silent> <Leader>h <Plug>(easymotion-linebackward)
nmap <silent> <Leader>l <Plug>(easymotion-lineforward)
xmap <silent> <Leader>l <Plug>(easymotion-lineforward)
nmap <silent> <Leader>j <Plug>(easymotion-j)
xmap <silent> <Leader>j <Plug>(easymotion-j)
nmap <silent> <Leader>k <Plug>(easymotion-k)
xmap <silent> <Leader>k <Plug>(easymotion-k)
nmap <silent> <Leader>w <Plug>(easymotion-w)
xmap <silent> <Leader>w <Plug>(easymotion-w)
nmap <silent> <Leader>b <Plug>(easymotion-b)
xmap <silent> <Leader>b <Plug>(easymotion-b)

"--------------EasyAlign-------------"

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"-------------UndoTree----------------"

nnoremap <F3> :UndotreeToggle<CR>

"-------------Vim-airline-------------"

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

"---------------OSCYank---------------"

vmap <Leader>yy <Plug>OSCYankVisual

"------------YouCompleteMe------------"

" Let g:ycm_key_list_stop_completion=['<C-TAB>']
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"--------------BulletsVim-------------"

let g:bullets_set_mappings = 1
augroup MarkdownSettings
    autocmd!
    autocmd Filetype markdown inoremap <C-t> <C-o>:BulletDemote<CR>
    autocmd Filetype markdown nnoremap >> :BulletDemote<CR>
    autocmd Filetype markdown inoremap <C-d> <C-o>:BulletPromote<CR>
    autocmd Filetype markdown nnoremap << :BulletPromote<CR>
augroup END

"------------------ALE----------------"

nnoremap <silent> <Leader>ep <Plug>(ale_previous_wrap)
nnoremap <silent> <Leader>en <Plug>(ale_next_wrap)
" Create a list of error for all buffers
nnoremap <silent> <Leader>ev :ALEPopulateQuickfix<CR>
" Show full detail of error
nnoremap <silent> <Leader>ed <Plug>(ale_detail)

"-------------VimTex------------------"

" augroup LatexSettings
    " autocmd!
    " "Italic
    " autocmd Filetype tex nnoremap <C-i> <Plug>(vimtex-cmd-create)textit<CR>
    " autocmd Filetype tex inoremap <C-i> <Esc><Plug>(vimtex-cmd-create)textit<CR>i
    " autocmd Filetype tex vnoremap <C-i> <Plug>(vimtex-cmd-create)textit<CR>
    " "Bold
    " autocmd Filetype tex nnoremap <C-b> <Plug>(vimtex-cmd-create)textbf<CR>
    " autocmd Filetype tex inoremap <C-b> <Esc><Plug>(vimtex-cmd-create)textbf<CR>i
    " autocmd Filetype tex vnoremap <C-b> <Plug>(vimtex-cmd-create)textbf<CR>
" augroup END
