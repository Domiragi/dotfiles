#! /bin/zsh

setopt NOMATCH
setopt NO_BEEP
export EDITOR=vim
# Make rm command to ask to before running with an asterisk *
setopt NO_RM_STAR_SILENT
# Make rm command wait 10s then execute rm with an asterisk *
setopt RM_STAR_WAIT
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path
# Add /usr/local/bin to path.
path=(/usr/local/{,s}bin(N) $path)

# Makes zsh behave the same with words as bash. Recommended to leave it this
# way since by default it simply behaves badly.
autoload -U select-word-style
select-word-style bash

# Disables highlighting of pasted text.
zle_highlight+=(paste:none)
# Load built-in zsh colors
autoload -Uz colors && colors

# Set color for man pages
export MANPAGER='less -i -R -s -M +Gg'
export LESS_TERMCAP_mb=$'\e[01;38;5;202m'    # begin bold
export LESS_TERMCAP_md=$'\e[38;5;71m'     # begin blink
export LESS_TERMCAP_so=$'\e[38;5;0;48;5;13m' # begin standout
export LESS_TERMCAP_se=$'\e[0m'              # reset standout
export LESS_TERMCAP_us=$'\e[04;38;5;166m'    # begin underline
export LESS_TERMCAP_ue=$'\e[0m'              # reset underline
export LESS_TERMCAP_me=$'\e[0m'              # reset bold/blink/underline
export GROFF_NO_SGR=1                        # for konsole and gnome-terminal

# Load custom .dir_colors if exist, otherwise use default
if [[ -f ~/.dir_colors ]] ; then
    eval $(dircolors -b ~/.dir_colors)
elif [[ -f /etc/DIR_COLORS ]] ; then
    eval $(dircolors -b /etc/DIR_COLORS)
fi
