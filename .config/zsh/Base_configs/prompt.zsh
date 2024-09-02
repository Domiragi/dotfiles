#!/bin/zsh

# References:
# https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
# https://github.com/IngoMeyer441/steeef/blob/master/steeef.theme.zsh - for updating Vim Prompt

autoload -Uz vcs_info
autoload -U add-zle-hook-widget
precmd() {
    vcs_info
    print -P ''
}

preexec() {
    print -P ''
}

# To see a list of all current enabled and disabled vcs, use command:
# vcs_info_print_sys
zstyle ':vcs_info:*' enable git
# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
# zstyle ':vcs_info:*' check-for-changes true

setopt PROMPT_SUBST
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%F{red}%c%u%b%f "
zstyle ':vcs_info:*' actionformats "%F{red}%c%u%b%f %a "
zstyle ':vcs_info:*' stagedstr "%F{cyan}"
zstyle ':vcs_info:*' unstagedstr "%F{magenta}"

# # 1: blink block 2:block 3:blinking underline 4:underline 5:blinking vertical bar 6:vertical bar
cursor_normal='\e[2 q'
cursor_insert='\e[1 q'

VIM_CURSOR_COLOR=''
function updatePromptVimMode {
    local previous_vi_keymap="${VI_KEYMAP}"
    case "${KEYMAP}" in
        vicmd)
            case "${REGION_ACTIVE}" in
                1)
                    VI_KEYMAP="VISUAL"
                    VIM_CURSOR_COLOR="yellow"
                    echo -ne $cursor_normal
                    ;;
                2)
                    VI_KEYMAP="V-LINE"
                    VIM_CURSOR_COLOR="yellow"
                    echo -ne $cursor_normal
                    ;;
                *)
                    VI_KEYMAP="NORMAL"
                    VIM_CURSOR_COLOR="green"
                    echo -ne $cursor_normal
                    ;;
            esac
            ;;
        viins|main)
            if [[ "${ZLE_STATE}" == *overwrite* ]]; then
                VI_KEYMAP="REPLACE"
                VIM_CURSOR_COLOR="red"
                echo -ne $cursor_insert
            else
                VI_KEYMAP="INSERT"
                VIM_CURSOR_COLOR="blue"
                echo -ne $cursor_insert
            fi
            ;;
    esac
    if [[ "${VI_KEYMAP}" != "${previous_vi_keymap}" ]]; then
        zle reset-prompt
    fi
}

function zle-line-init {
    VI_KEYMAP=""
    updatePromptVimMode
}

zle -N zle-line-init
add-zle-hook-widget line-pre-redraw updatePromptVimMode

# Addition Prompt Info:
# %n: $USERNAME
# %m: Full machine hostname
# %T: Time in 24h, %@: Time in 12h AM/PM, %D: date in YY-MM-DD, %W: date in MM/DD/YY

# Change prompt to magenta if previously executed command was errored or canceled
CUSTOM_PROMPT='%F{99}%~%f ${vcs_info_msg_0_}%F{$VIM_CURSOR_COLOR}❯❯❯%f '
# # Make the prompt stay at least 8 lines from the bottom
# # By printing 8 lines, moving the cursor up then printing the actual prompt
PROMPT_PAD=$'%{\n\n\n\n\n\n\n\n\e[8A%}'
PS1="$PROMPT_PAD$CUSTOM_PROMPT"

