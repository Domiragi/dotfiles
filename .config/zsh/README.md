# ZSH Config
The `.zshenv` file is always loaded and is the first file to be loaded upon opening a shell. We set the default location for all zsh files/config files to be `~/.config/zsh`; to achieve this we need to set the default user `.zshenv` file to update the `ZDOTDIR` env variable, either through the installation script, or directly making a `~/.zshenv` file to set this, or run the code below in terminal:
```zsh
# change the root .zshenv file to use ZDOTDIR
cat << 'EOF' >| ~/.zshenv
export ZDOTDIR=~/.config/zsh
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
EOF
```
## Color Output
This is mostly for the output of `man`(which uses `less`) and the use of `dir_colors`(which dictates the colors of `ls`).
Many common terminals nowaways support true colors (24-bit color, using the RGB system with upto 16 million colors). You can use that if you want, check the link to wikipedia below to see the encoding example.

References:
- https://unix.stackexchange.com/questions/119/colors-in-man-pages
- https://unix.stackexchange.com/questions/108699/documentation-on-less-termcap-variables
- https://en.wikipedia.org/wiki/ANSI_escape_code
    * Note that for `less`, for 3 and 4-bit color, code 30-37 set color for fg, while 40-47 sets color for bg. For 8-bit color, the notation is `\e[38;5;(n)m` for fg and `\e[48;5;(n)m` for bg. For `dir_colors`, it uses the normal color mapping (000 is black, 001 is red, etc).
- https://wiki.archlinux.org/title/Color_output_in_console#man
