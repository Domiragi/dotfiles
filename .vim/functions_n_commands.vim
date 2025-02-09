" create directories before writing to file if no file exists
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Filter and make a new Quickfix list/Loclist to only show info/warning/error

function s:LocListInfoFilter()
    let filteredList = getloclist(winnr())->filter({idx, val -> val.type == 'I'})
    call setloclist(winnr(), filteredList)
endfunction

function s:LocListWarningFilter()
    let filteredList = getloclist(winnr())->filter({idx, val -> val.type == 'W'})
    call setloclist(winnr(), filteredList)
endfunction

function s:LocListErrorFilter()
    let filteredList = getloclist(winnr())->filter({idx, val -> val.type == 'E'})
    call setloclist(winnr(), filteredList)
endfunction

function s:QFListInfoFilter()
    let filteredList = getqflist()->filter({idx, val -> val.type == 'I'})
    call setqflist(filteredList)
endfunction

function s:QFListWarningFilter()
    let filteredList = getqflist()->filter({idx, val -> val.type == 'W'})
    call setqflist(filteredList)
endfunction

function s:QFListErrorFilter()
    let filteredList = getqflist()->filter({idx, val -> val.type == 'E'})
    call setqflist(filteredList)
endfunction

command LLI :call s:LocListInfoFilter()
command LLW :call s:LocListWarningFilter()
command LLE :call s:LocListErrorFilter()
command QFI :call s:QFListInfoFilter()
command QFW :call s:QFListWarningFilter()
command QFE :call s:QFListErrorFilter()

" Open the current tex file as pdf with Zathura

command PDF execute ":silent !zathura '%:r'.pdf &" | execute ":redraw!"

" Miscs

command CHS :h cheatsheet
command ECHS :e $HOME/dotfiles/.vim/doc/cheatsheet.txt | :set wrap | :set textwidth=80 | :set linebreak
