
"**********  Options  **********

set nocompatible " Set VIM to be incompatible with VI for better QOL improvements by setting several options
filetype plugin indent on
set nowrap
" Set text to wrap if filetype is text or MD
augroup SetFileType
    autocmd!
    autocmd FileType text,markdown,tex setlocal wrap
    autocmd BufNewFile,BufRead,BufEnter *.md syn match markdownIgnore "\w\@<=\w\@="
augroup END
syntax on
if has('mouse')
    set mouse       =a
    set mousemodel  =popup_setpos
endif
set autoindent
set autoread
set backspace       =indent,eol,start
set belloff         =all
set breakindent
set breakindentopt  =min:40 " Indent with at least 41 character width remaining
set copyindent
set cursorline
set display         =lastline
set encoding        =utf-8
set expandtab " Expand tab into space
set fileencoding    =utf-8
set formatoptions  +=j
set hidden
set history         =1000
set hlsearch
set incsearch
set laststatus      =2
set linebreak " Break line at word
set list
set listchars       =tab:\|\ 
set modelines       =0
set nojoinspaces
set noshowmode
set nostartofline
set number
set scrolloff       =5
set sessionoptions -=options
set sidescroll      =1
set signcolumn      =yes
set shiftwidth      =4
set showmatch " Highlight matching brace
set startofline
set softtabstop     =4
set tags            ="./tags;,tags"
set termguicolors
set ttimeout
set ttimeoutlen     =10
set ttyfast
set undolevels      =1000
set viewoptions    -=options
set wildignore     +=*.class,*.elf,*.jpg,*.jpeg,*.o,*.out,*.pdf,*.png,*.pyc,*.img
set nowildmenu
set wildmode        =list,full
set wrapscan


"**********  Term-Options  **********

function! SetWindowsTerminal()
    if has("unix")
        let lines = readfile("/proc/version")
        if lines[0] =~ "Microsoft" || lines[0] =~ "microsoft"
            " Fix an error with using Linux in Windows, specifically WSL; which causes
            " Vim to be defaulting to Replace mode upon opening
            set t_u7 =
            " Fix an error with Windows setting the wrong background color
            set t_ut =""
        endif
    endif
endfunction

" Set cursor shape regardless of terminals
" 1: blink block 2:block 3:blinking underline 4:underline 5:blinking vertical bar 6:vertical bar
let &t_SI = "\<Esc>[1 q" "Input mode
let &t_SR = "\<Esc>[1 q" "Replace mode
let &t_EI = "\<Esc>[2 q" "Normal mode
