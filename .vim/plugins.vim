"**********  Package  **********
packadd! matchit " Package for jumping to matching tags (if-endif, etc) using the '%' command

"**********  Plugins  **********

" Automatically install vim-plug
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    let need_to_install_plugins = 1
endif
" Plugin will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')

" Declare plugins
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
 Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'} |
     \ Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'psliwka/vim-smoothie'
Plug 'bullets-vim/bullets.vim', {'for': 'text, markdown, gitcommit'}
Plug 'dstein64/vim-startuptime'

" Enable copying to system clipboard on systems that supports ANSI OSC52
" Not needed for NeoVim as it has this by default
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

" YouCompleteMe is a code-completion pluggin, which is heavy by default; to install uncomment and run :PlugInstall
" Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}

" Theming
Plug 'haishanh/night-owl.vim'

" List ends here, after this call plugins will become visible to Vim
call plug#end()

" Automatically run PlugInstall on first startup
if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif


"**********  Plugins Settings  **********

"""NerdCommenter"""
let NERDTreeCommentEmptyLines = 1
let NERDSpaceDelims = 1
let NERDCompactSexyComs = 1

" Set custom delimiters
"let g:NERDCustomDelimiters = {
    "\ 'ruby': { 'left': '#', 'leftAlt': 'FOO', 'rightAlt': 'BAR' },
"\ }

"""NerdTree"""
" This plugin can be substituted for other lighter methods. It is used mainly
" for providing a nice toggleable tree view of the filesystem.
let NERDTreeShowHidden = 1
let NERDTreeIgnore     = ['\.swp[[file]]$', '\~$']
let NERDTreeMouseMode  = 2
augroup NerdTreeSettings
    autocmd!
    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
        \ call feedkeys(":quit\<CR>:\<BS>") |
        \ endif
    " Close the tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
        \ call feedkeys(":quit\<CR>:\<BS>") |
        \ endif
    " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
    autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
        \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
augroup END

" Uncomment below code to add custom syntax highlight
"NerdTree file highlighting
"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg.' guifg='. a:guifg
"exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction
"call NERDTreeHighlightFile('jade','green','none','green','#151515')

"""NerdTreeGit"""
let g:NERDTreeGitStatusConcealBrackets    = 1
let g:NERDTreeGitStatusShowClean          = 0
" The next 2 features are quite heavy, disable if Vim gets slow
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusShowIgnored        = 1

let g:NERDTreeGitStatusIndicatorMapCustom = {
   \ 'Modified'  : '',
   \ 'Staged'    : '󰕒',
   \ 'Untracked' : '󰫻',
   \ 'Renamed'   : '',
   \ 'Unmerged'  : '󰃻',
   \ 'Deleted'   : '',
   \ 'Dirty'     : '',
   \ 'Ignored'   : '󰜺',
   \ 'Clean'     : '',
   \ 'Unknown'   : '?',
   \ }

let g:NERDTreeGitStatusHighlightingCustom = {
   \ 'Staged'    : 'ctermfg=34  guifg=#00AF00',
   \ 'Untracked' : 'ctermfg=160 guifg=#D70000',
   \ 'Deleted'   : 'ctermfg=160 guifg=#D70000',
   \ 'Ignored'   : 'ctermfg=243 guifg=#637777',
   \ 'Clean'     : 'ctermfg=34  guifg=#00AF00',
   \ }

"""AutoPairs"""
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutToggle = ""

"""vim-better-whitespace"""
let g:better_whitespace_filetypes_blacklist = ['diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'fugitive']
let g:show_spaces_that_precede_tabs = 1
let g:better_whitespace_ctermcolor  = "214"
let g:better_whitespace_guicolor    = "#d6801a"

"""indentLine"""
let g:indentLine_char="|"

"""EasyMotion"""
let g:EasyMotion_smartcase  = 1
let g:EasyMotion_keys       = "qwertyuiopzxcvbnmasdfghjkl"

"""undotree"""
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_CustomUndotreeCmd  = 'topleft vertical 30 new'
let g:undotree_CustomDiffpanelCmd = 'botright 10 new'
let g:undotree_TreeNodeShape      = 'o'
let g:undotree_ShortIndicators    = 1
"If set persistent_undo, will save undo history into a file under a specified directory
if has ("persistent_undo")
    set undodir=$HOME."/.undodir"
    set undofile
endif

"""vim-startify"""
let g:ascii= [
    \'░░░░░░░█▐▓▓░████▄▄▄█▀▄▓▓▓▌█ very cool',
    \'░░░░░▄█▌▀▄▓▓▄▄▄▄▀▀▀▄▓▓▓▓▓▌█',
    \'░░░▄█▀▀▄▓█▓▓▓▓▓▓▓▓▓▓▓▓▀░▓▌█',
    \'░░█▀▄▓▓▓███▓▓▓███▓▓▓▄░░▄▓▐█▌ such awesome',
    \'░█▌▓▓▓▀▀▓▓▓▓███▓▓▓▓▓▓▓▄▀▓▓▐█',
    \'▐█▐██▐░▄▓▓▓▓▓▀▄░▀▓▓▓▓▓▓▓▓▓▌█▌',
    \'█▌███▓▓▓▓▓▓▓▓▐░░▄▓▓███▓▓▓▄▀▐█ much amazing',
    \'█▐█▓▀░░▀▓▓▓▓▓▓▓▓▓██████▓▓▓▓▐█',
    \'▌▓▄▌▀░▀░▐▀█▄▓▓██████████▓▓▓▌█▌',
    \'▌▓▓▓▄▄▀▀▓▓▓▀▓▓▓▓▓▓▓▓█▓█▓█▓▓▌█▌',
    \'█▐▓▓▓▓▓▓▄▄▄▓▓▓▓▓▓█▓█▓█▓█▓▓▓▐█ WoW'
    \]
let g:startify_custom_header = startify#pad(g:ascii)
let g:startify_lists = [
            \{ 'type': 'files',     'header': ['   Files']            },
            \{ 'type': 'dir',       'header': ['   Folders '. getcwd()] },
            \{ 'type': 'sessions',  'header': ['   Sessions']       },
            \{ 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \{ 'type': 'commands',  'header': ['   Commands']       },
            \]

"To set bookmark, use the syntax: {'folder':'path/to/folder'}
let g:startify_bookmarks          = []
let g:startify_session_dir        = '~/.vim/sessions'
let g:startify_update_oldfiles    = 1
let g:startify_files_number       = 15
let g:startify_change_to_vcs_root = 1
let g:startify_session_sort       = 1

"""Vim-airline"""
let g:airline_theme='vndrx'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts    = 1
let g:airline_symbols.dirty      = ''
let g:airline_symbols.linenr     = ' |'
let g:airline_symbols.colnr      = ' '
let g:airline_symbols.maxlinenr  = '|'
let g:airline_symbols.whitespace = ''
let g:airline_section_y          = ''
let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#tab_nr_type     = 1
let g:airline#extensions#tabline#buffers_label   = 'buf'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter       = 'unique_tail'

"""YouCompleteMe"""
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion=3
