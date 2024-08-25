#######
# TOC #
#######
# Aliases
# Behaviors
# Completions
# History
# Keybindings

###########
# Aliases #
###########

# Enable autocompleting alias commands
setopt completealiases
alias reshell='exec zsh'
alias ls='ls --color=auto -Ahp --group-directories-first'
alias l1='ls -1'
alias lo='ls -o'
alias lt='lo -ct'
alias dir='dir --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
[[ -n "$commands[tree]" ]] && alias lt="tree -C"
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias less='less -i'
alias np='nano -w PKGBUILD'
alias more=less
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias ln="ln -i"
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias clear='clear -x'

#############
# Behaviors #
#############

setopt nomatch
unsetopt beep
bindkey -v
export EDITOR=neovim
# Make rm command to ask to before running with an asterisk *
unsetopt RM_STAR_SILENT
# Make rm command wait 10s then execute rm with an asterisk *
setopt RM_STAR_WAIT
# Makes zsh behave the same with words as bash. Recommended to leave it this
# way since by default it simply behaves badly.
autoload -U select-word-style
select-word-style bash

# Disables highlighting of pasted text.
zle_highlight+=(paste:none)

if [[ -f ~/.dir_colors ]] ; then
    eval $(dircolors -b ~/.dir_colors)
elif [[ -f /etc/DIR_COLORS ]] ; then
    eval $(dircolors -b /etc/DIR_COLORS)
fi

###############
# Completions #
###############

# # By default zcompdump is created in the home directory, so we will create a
# # directory for the zsh cache in a separate directory to clean things up a
# # little bit.
# CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

# # Creates the cache directory if doesn't exist, as compinit will fail if it
# # doesn't find the directory in which .zcompdump is specified to be located.
# [[ ! -d "$CACHE_DIR" ]] && mkdir -p "$CACHE_DIR"

# # Changes the zcompdump directory. The .zcompdump file is used to improve
# # compinit's initialization time.
# declare -A ZINIT
# ZINIT[ZCOMPDUMP_PATH]="$CACHE_DIR/.zcompdump"

zstyle :compinstall filename '/home/vndrx/.zshrc'

autoload -Uz compinit
compinit

# Matches completion menu colors with the LS_COLORS variable.
[[ -n $LS_COLORS ]] && zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Arrow key menu for completions
zstyle ':completion:*' menu select

# Case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

###########
# History #
###########

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

# Share history between sessions
setopt share_history
# Append command to history file once executed rather than when the shell exits
setopt inc_append_history
# Don't display duplicates
setopt hist_find_no_dups
# When a new command is entered, remove the duplicate older one from history list
setopt hist_ignore_dups
# Ignore if command start with a whitespace
setopt hist_ignore_space

##############
# Keybinding #
##############

# Only show past commands that include the current input
# Move cursor to the end after each match
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
# [Ctrl-LeftArrow] - move backward one word
bindkey "^[[1;5D" backward-word
# [Ctrl-RightArrow] - move forward one word
bindkey "^[[1;5C" forward-word
# [Shift-Tab] - move through the completion menu backwards
bindkey "^[[Z" reverse-menu-complete
# [Delete] - delete forward
bindkey "^[[3~" delete-char

#########
# Miscs #
#########

# Addition Prompt Info:
# %n: $USERNAME
# %m: Full machine hostname
# %T: Time in 24h, %@: Time in 12h AM/PM, %D: date in YY-MM-DD, %W: date in MM/DD/YY
autoload -Uz vcs_info
precmd() { vcs_info }

# To see a list of all current enabled and disabled vcs, use command:
# vcs_info_print_sys
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%F{red}%b%c%u%f '
zstyle ':vcs_info:*' formats '%F{red}%b%c%u%f '
zstyle ':vcs_info:*' actionformats '%F{red}%b%f|%F{red}%a%f '
setopt prompt_subst
PROMPT='%F{blue}%~ ${vcs_info_msg_0_}%(?.%F{green}.%F{red})❯❯❯%f '
# Make the prompt stay at least 8 lines from the bottom
# By printing 8 lines, moving the cursor up then printing the actual prompt
PS1=$'\n\n\n\n\n\n\n\n\e[8A'"$PS1"
