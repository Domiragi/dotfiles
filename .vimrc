
"Automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
func
"Plugin will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')

"Declare list of plugins
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
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'haishanh/night-owl.vim'

"List ends here, after this call plugins will become visible to Vim
call plug#end()

"**********  Behavior  **********

syntax on
set nocp
set expandtab
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set autoindent
set nocompatible
"Break lines at word
set linebreak
set textwidth=200
set wrap
set breakindent
set wrapscan
"indent with at least 40 character width remaining
set breakindentopt=min:40
filetype plugin indent on
set encoding  =utf-8
set modelines =0
"Highlight matching brace
set showmatch
set showmode
set ttyfast
set laststatus=2
set cul
set number
set backspace =indent,eol,start
"Highlight all search results (Disabled since easy-motion also has search function)
"set hlsearch
set undolevels=1000
"set spell

"set color scheme
set termguicolors
set t_ut=""
if filereadable(expand("$HOME/.vim/plugged/night-owl.vim/colors/night-owl.vim"))
	colorscheme night-owl
else
	colorscheme desert
endif

"fix an error with using Linux in Windows, specifically WSL; which causes opening
"up Vim will be defaulting to Replace mode
set t_u7=

"**********  Key mapping  **********

inoremap kj <ESC>
let mapleader ="\<SPACE>"
"Press Enter after search to remove hightlight
nnoremap <silent> <CR> :nohlsearch <CR><CR>

"A small script to enable Metakey(Alt)
for i in range(97,122)
    let c=nr2char(i)
    exec "map \e".c." <M-".c.">"
    exec "map! \e".c." <M-".c.">"
endfor
"Go to the beginning of a line
nnoremap <C-a> <ESC>^
inoremap <C-a> <ESC>^
"Go to the end of a line
nnoremap <A-a> <ESC>$
inoremap <A-a> <ESC>$
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

"**********  Plugins  **********

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion=3
"let g:ycm_key_list_stop_completion=['<C-TAB>']
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"NerdTree
map <C-e> :NERDTreeToggle<CR>
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

"vim-better-whitespace
let g:better_whitespace_enabled=0
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']
let g:show_spaces_that_precede_tabs=1

"indentLine
let g:indentLine_char="|"

"vim-easymotion
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

"vim-multiple-cursors
let g:multi_cursor_use_default_mapping = 0

let g:multi_cursor_start_word_key      = '<Leader>n'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<Leader>n'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"undotree
nnoremap <F3> :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_CustomUndotreeCmd  = 'topleft vertical 30 new'
let g:undotree_CustomDiffpanelCmd = 'botright 10 new'
let g:undotree_TreeNodeShape = 'o'
"if set persistent_undo, will save undo history into a file under a specified directory
if has ("persistent_undo")
    set undodir=$HOME."/.undodir"
    set undofile
endif

"vim-startify
let g:startify_lists = [
            \{ 'type': 'files',     'header': ['   Files ']            },
            \{ 'type': 'dir',       'header': ['   Folders '. getcwd()] },
            \{ 'type': 'sessions',  'header': ['   Sessions']       },
            \{ 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \{ 'type': 'commands',  'header': ['   Commands']       },
            \]

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
let g:startify_custom_header =
            \ startify#pad(g:ascii)

"to set bookmark, use the syntax: {'folder':'path/to/folder'}
let g:startify_bookmarks = []
let g:startify_update_oldfiles = 1
let g:startify_files_number = 10

"Vim-airline
let g:airline_theme='desertink'
let g:airline_powerline_fonts=1
"stop the delay/pause when leaving insert mode
let ttimeoutlen=10
