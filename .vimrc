" Source files
source $HOME/.vim/plugins.vim
source $HOME/.vim/options.vim
source $HOME/.vim/keymappings.vim

" Set Theme
if filereadable(expand("$HOME/.vim/plugged/night-owl.vim/colors/night-owl.vim"))
    colorscheme night-owl
else
    colorscheme desert
endif

" Setup for using WSL on Windows
autocmd VIMEnter * call SetWindowsTerminal()
autocmd VIMEnter * call SetVimAirlineMapping()

