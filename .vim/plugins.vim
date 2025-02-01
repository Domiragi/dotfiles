"*******************************
"*           Package           *
"*******************************

packadd! matchit " Package for jumping to matching tags (if-endif, etc) using the '%' command
packadd cfilter " Package for filtering Quickfix list and Location list

"*******************************
"*           Plugins           *
"*******************************

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
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'bullets-vim/bullets.vim', {'for': ['text', 'markdown', 'gitcommit']}
Plug 'dstein64/vim-startuptime'
Plug 'dense-analysis/ale'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

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

"*******************************
"*           Settings          *
"*******************************

" Set Theme
if filereadable(expand("$HOME/.vim/plugged/night-owl.vim/colors/night-owl.vim"))
    silent! colorscheme night-owl
else
    silent! colorscheme desert
endif

"------------NerdCommenter------------"

let NERDTreeCommentEmptyLines = 1
let NERDSpaceDelims = 1
let NERDCompactSexyComs = 1

" Set custom delimiters
"let g:NERDCustomDelimiters = {
    "\ 'ruby': { 'left': '#', 'leftAlt': 'FOO', 'rightAlt': 'BAR' },
"\ }

"---------------NerdTree--------------"

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

"-------------NerdTreeGit-------------"

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

"--------------AutoPairs--------------"

let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutToggle = ""

"--------vim-better-whitespace--------"

let g:better_whitespace_filetypes_blacklist = ['diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'fugitive']
let g:show_spaces_that_precede_tabs = 1
let g:better_whitespace_ctermcolor  = "214"
let g:better_whitespace_guicolor    = "#d6801a"

"--------------IndentLine-------------"

let g:indentLine_char="|"

"--------------EasyMotion-------------"

let g:EasyMotion_smartcase  = 1
let g:EasyMotion_keys       = "qwertyuiopzxcvbnmasdfghjkl"

"-------------UndoTree----------------"

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

"-------------vim-startify------------"

let g:ascii= [
    \ '░░░░░░░█▐▓▓░████▄▄▄█▀▄▓▓▓▌█ very cool',
    \ '░░░░░▄█▌▀▄▓▓▄▄▄▄▀▀▀▄▓▓▓▓▓▌█',
    \ '░░░▄█▀▀▄▓█▓▓▓▓▓▓▓▓▓▓▓▓▀░▓▌█',
    \ '░░█▀▄▓▓▓███▓▓▓███▓▓▓▄░░▄▓▐█▌ such awesome',
    \ '░█▌▓▓▓▀▀▓▓▓▓███▓▓▓▓▓▓▓▄▀▓▓▐█',
    \ '▐█▐██▐░▄▓▓▓▓▓▀▄░▀▓▓▓▓▓▓▓▓▓▌█▌',
    \ '█▌███▓▓▓▓▓▓▓▓▐░░▄▓▓███▓▓▓▄▀▐█ much amazing',
    \ '█▐█▓▀░░▀▓▓▓▓▓▓▓▓▓██████▓▓▓▓▐█',
    \ '▌▓▄▌▀░▀░▐▀█▄▓▓██████████▓▓▓▌█▌',
    \ '▌▓▓▓▄▄▀▀▓▓▓▀▓▓▓▓▓▓▓▓█▓█▓█▓▓▌█▌',
    \ '█▐▓▓▓▓▓▓▄▄▄▓▓▓▓▓▓█▓█▓█▓█▓▓▓▐█ WoW'
\ ]
let g:startify_custom_header = startify#pad(g:ascii)
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   Files']            },
            \ { 'type': 'dir',       'header': ['   Folders '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
\ ]

"To set bookmark, use the syntax: {'folder':'path/to/folder'}
let g:startify_bookmarks          = []
let g:startify_session_dir        = '~/.vim/sessions'
let g:startify_update_oldfiles    = 1
let g:startify_files_number       = 15
let g:startify_change_to_vcs_root = 1
let g:startify_session_sort       = 1

"-------------Vim-airline-------------"

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

"------------YouCompleteMe------------"

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion=3

"------------------ALE----------------"

" Define/enable linters for a filetype
let g:ale_linters = {
    \ 'c'      :['cc', 'clangformat', 'clangtidy'],
    \ 'cpp'    :['cc', 'clangformat', 'clangtidy'],
    \ 'cmake'  :['cmakelint', 'cmake-lint'],
    \ 'make'   :['checkmake'],
    \ 'python' :['ruff'],
    \ 'sh'     :['shell', 'shellcheck'],
    \ 'text'   :['cspell', 'write-good']
\ }

" Let one filetype to use the set of linters of another filetype
" The user defined linter dictionary will be merged with the default
" This sets and overrides the default value
let g:ale_linter_aliases = {
    \ 'markdown':['markdown', 'html', 'css']
\ }

let g:ale_enabled     = 1
let g:ale_disable_lsp = 1
let g:ale_echo_cursor = 1 " Echo error messages near the cursor"
let g:ale_completion_enabled = 0
let g:ale_virtualtext_cursor = 0
" Disable for md file since I have no need to check for it yet
let g:ale_pattern_options = {
    \ '\.md$': {'ale_enabled': 0},
\}
let g:ale_warn_about_trailing_blank_lines = 0
let g:ale_warn_about_trailing_whitespace = 0

" Syntax & highlight
let g:ale_change_sign_column_color = 1
let g:ale_sign_highlight_linenrs   = 1
let g:ale_sign_error   = " ◉"
let g:ale_sign_warning = " ◉"
highlight ALEErrorSign               ctermfg=9   ctermbg=233 guifg=#C30500 guibg=#011627
highlight ALEErrorSignLineNr         ctermfg=9   ctermbg=233 guifg=#C30500 guibg=#011627
highlight ALEWarningSign             ctermfg=208 ctermbg=233 guifg=#FA7B20 guibg=#011627
highlight ALEWarningSignLineNr       ctermfg=208 ctermbg=233 guifg=#FA7B20 guibg=#011627
highlight ALESignColumnWithErrors    ctermfg=0   ctermbg=233 guifg=#A5A5A5 guibg=#011627
highlight ALESignColumnWithoutErrors ctermfg=0   ctermbg=233 guifg=#A5A5A5 guibg=#011627

" Set ALE to populate the loclist and/or quickfix list
let g:ale_set_loclist  = 1
let g:ale_set_quickfix = 0

" Enable the next options to show error window at cursor
" let g:ale_cursor_detail = 1
" let g:ale_detail_to_floating_preview = 0
" let g:ale_close_preview_on_insert = 1
" let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

"-------------VimTex------------------"

" Use lualatex when there is a system font, not when on WSL
" let g:vimtex_compiler_latexmk_engines = {'_': '-lualatex'}
let g:vimtex_syntax_conceal_disable = 1
let g:vimtex_indent_on_ampersands = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_toc_config = {
    \ 'fold_enable': 1,
    \ 'hide_line_numbers': 0,
    \ 'indent_levels': 1,
    \ 'layer_status': {
        \ 'content': 1,
        \ 'label': 1,
        \ 'todo': 1,
        \ 'include': 0
    \ },
    \ 'tocdepth': 5,
    \ 'show_help': 0,
\ }
let g:vimtex_view_method = 'zathura'

" Cleanup auxilary files on quit
augroup vimtex_event_1
    autocmd!
    autocmd User VimtexEventQuit     VimtexClean
augroup END

"----------UltiSnips---------------"

let g:UltiSnipsSnippetDirectories = ["UltiSnips", "Snippets"]
