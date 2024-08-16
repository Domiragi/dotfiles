" Source files
source $HOME/.vim/options.vim
source $HOME/.vim/keymappings.vim
source $HOME/.vim/plugins.vim
source $HOME/.vim/plugins_keymappings.vim
source $HOME/.vim/functions.vim

" Setup for using WSL on Windows
augroup SetWindowsSettings
    autocmd!
    autocmd VIMEnter * call SetWindowsTerminal()
    autocmd VIMEnter * call SetVimAirlineMapping()
augroup END
