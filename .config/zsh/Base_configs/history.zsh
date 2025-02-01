#! bin/zsh

HISTFILE=$HOME/.config/zsh/.zsh_history
HISTSIZE=30000
SAVEHIST=100000

setopt SHARE_HISTORY          # Share history between sessions
setopt INC_APPEND_HISTORY     # Append command to history file once executed rather than when the shell exits
setopt HIST_FIND_NO_DUPS      # Don't display duplicates
setopt HIST_IGNORE_DUPS       # When a new command is entered, remove the duplicate older one from history list
setopt HIST_IGNORE_SPACE      # Ignore if command start with a whitespace
setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_REDUCE_BLANKS     # Remove extra blanks from commands added to the history list.
setopt NO_HIST_BEEP           # Don't beep when accessing non-existent history.
