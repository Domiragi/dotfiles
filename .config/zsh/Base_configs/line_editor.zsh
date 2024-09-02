#!/bin/zsh

# Line editor manages the editing/writing of command in Zsh, which is either Emacs mode, or Vim mode
# To see the current list of keybinding in a specific mode, enter command:
# bindkey -M [mode]

# Set vim as default
bindkey -v
# Setting KEYTIMEOUT value too low can affect whether key input can be read correctly or not
export KEYTIMEOUT=20

# -v: Keymap for viins mode
# -a: Keymap for vicmd mode
bindkey -v "kj" vi-cmd-mode
bindkey -a "^a" beginning-of-line
bindkey -a "^[a" end-of-line

# Only show past commands that include the current input
# Move cursor to the end after each match
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Similar to history-beginning-search-backward, but instead show a selection menu of the entire history
autoload -Uz history-beginning-search-menu
# Put cursor at the end after search
autoload -Uz history-search-end
# Bind the 2 widgets together
zle -N history-search-end history-beginning-search-menu
bindkey -v "^F" history-search-end

# [Ctrl-LeftArrow] - move backward one word
bindkey "^[[1;5D" backward-word
# [Ctrl-RightArrow] - move forward one word
bindkey "^[[1;5C" forward-word
# [Shift-Tab] - move through the completion menu backwards
bindkey "^[[Z" reverse-menu-complete
# [Delete] - delete forward
bindkey "^[[3~" delete-char

# Add text objects
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# Vim-surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh
# https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
function symmetric-ctrl-z {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}
zle -N symmetric-ctrl-z

# ctrl-z sends things to the background - make it also bring to forground
bindkey -v '^Z' symmetric-ctrl-z
