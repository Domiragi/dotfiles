"**********  Package  **********
packadd! matchit " Package for jumping to matching tags (if-endif, etc) using the '%' command

"**********  Plugins  **********

"Automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
func
"Plugin will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')

"Declare plugins
"YouCompleteMe is a code-completion pluggin, which is heavy by default; to install uncomment and run :PlugInstall
"Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
"Theming
Plug 'vim-airline/vim-airline-themes'
Plug 'haishanh/night-owl.vim'

"List ends here, after this call plugins will become visible to Vim
call plug#end()

"**********  Plugins Settings  **********

"""YouCompleteMe"""
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion=3

""""NerdTree"""
let NERDTreeShowHidden=1
"Make sure that vim doesn't open files and other buffers on NERDTree window
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
"NerdTree file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg.' guifg='. a:guifg
exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade','green','none','green','#151515')
call NERDTreeHighlightFile('ini','yellow','none','yellow','#151515')
call NERDTreeHighlightFile('md','blue','none','#3366FF','#151515')
call NERDTreeHighlightFile('yml','yellow','none','yellow','#151515')
call NERDTreeHighlightFile('config','yellow','none','yellow','#151515')
call NERDTreeHighlightFile('conf','yellow','none','yellow','#151515')
call NERDTreeHighlightFile('json','yellow','none','yellow','#151515')
call NERDTreeHighlightFile('html','yellow','none','yellow','#151515')
call NERDTreeHighlightFile('styl','cyan','none','cyan','#151515')
call NERDTreeHighlightFile('css','cyan','none','cyan','#151515')
call NERDTreeHighlightFile('coffee','red','none','red','#151515')
call NERDTreeHighlightFile('js','red','none','#ffa500','#151515')
call NERDTreeHighlightFile('php','magenta','none','#ff00ff','#151515')

"""vim-better-whitespace"""
let g:better_whitespace_enabled=0
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']
let g:show_spaces_that_precede_tabs=1

"""indentLine"""
let g:indentLine_char="|"

"""vim-multiple-cursors"""
let g:multi_cursor_use_default_mapping = 0

let g:multi_cursor_start_word_key      = '<Leader>n'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<Leader>n'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"""vim-easy-align"""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"""undotree"""
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_CustomUndotreeCmd  = 'topleft vertical 30 new'
let g:undotree_CustomDiffpanelCmd = 'botright 10 new'
let g:undotree_TreeNodeShape = 'o'
"If set persistent_undo, will save undo history into a file under a specified directory
if has ("persistent_undo")
    set undodir=$HOME."/.undodir"
    set undofile
endif

"""vim-startify"""
let g:ascii= [
    \'░░░░░░░█▐▓▓░████▄▄▄█▀▄▓▓▓▌█ very cool',
    \'░░░░░▄█▌▀▄▓▓▄▄▄▄▀▀▀▄▓▓▓▓▓▌█ ',
    \'░░░▄█▀▀▄▓█▓▓▓▓▓▓▓▓▓▓▓▓▀░▓▌█ ',
    \'░░█▀▄▓▓▓███▓▓▓███▓▓▓▄░░▄▓▐█▌ such awesome',
    \'░█▌▓▓▓▀▀▓▓▓▓███▓▓▓▓▓▓▓▄▀▓▓▐█ ',
    \'▐█▐██▐░▄▓▓▓▓▓▀▄░▀▓▓▓▓▓▓▓▓▓▌█▌ ',
    \'█▌███▓▓▓▓▓▓▓▓▐░░▄▓▓███▓▓▓▄▀▐█ much amazing',
    \'█▐█▓▀░░▀▓▓▓▓▓▓▓▓▓██████▓▓▓▓▐█ ',
    \'▌▓▄▌▀░▀░▐▀█▄▓▓██████████▓▓▓▌█▌ ',
    \'▌▓▓▓▄▄▀▀▓▓▓▀▓▓▓▓▓▓▓▓█▓█▓█▓▓▌█▌ ',
    \'█▐▓▓▓▓▓▓▄▄▄▓▓▓▓▓▓█▓█▓█▓█▓▓▓▐█ WoW'
    \]
let g:startify_custom_header = startify#pad(g:ascii)
let g:startify_lists = [
            \{ 'type': 'files',     'header': ['   Files ']            },
            \{ 'type': 'dir',       'header': ['   Folders '. getcwd()] },
            \{ 'type': 'sessions',  'header': ['   Sessions']       },
            \{ 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \{ 'type': 'commands',  'header': ['   Commands']       },
            \]

"To set bookmark, use the syntax: {'folder':'path/to/folder'}
let g:startify_bookmarks = []
let g:startify_session_dir = '~/.vim/session'
let g:startify_update_oldfiles = 1
let g:startify_files_number = 15
let g:startify_change_to_vcs_root = 1
let g:startify_session_sort = 1

"""Vim-airline"""
let g:airline_theme='vndrx'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.dirty='*'
let g:airline_symbols.linenr = ' |'
let g:airline_symbols.colnr = ' '
let g:airline_symbols.maxlinenr = '|'
let g:airline_symbols.whitespace = ''
let g:airline_section_y =''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffers_label = 'buf'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Stop the delay/pause when leaving insert mode
let ttimeoutlen=10
