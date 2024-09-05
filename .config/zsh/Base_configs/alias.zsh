#! /bin/zsh

# Enable autocompleting alias commands
setopt COMPLETEALIASES
alias reshell='exec zsh'
alias ls='ls --color=auto -Ahp --group-directories-first'
alias l1='ls -1s'
alias lo='ls -o'
alias lt='ls -oct' # Sort file by modification time
alias ltr='ls -roct' # Sort file by modification time in reverse
alias dir='dir --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
[[ -n "$commands[tree]" ]] && alias lt="tree -C"
alias df='df -h'
alias du='du -h'
alias du1='du -d1' # Show disk usage of the files and folders in the current directory without recursion
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
alias fdir='find . -type d -name' # Find dir in current directory
alias ff='find . -type f -name' # Find file in current directory
alias hgrep='fc -El 0 | grep' # Search command in history, display command number and time of execution
# Print a simple colormap.
alias colormap='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+"\n"}; done'

# YAY aliases
alias yayi="yay -S"     # Install package
alias yayil="yay -U"    # Install package from local file
alias yayls="yay -Qe"   # List installed packages
alias yayrm="yay -Rns"  # Remove package with its settings and uneeded dependencies
alias yayclr="yay -Scc" # Remove all old and unused cached packages
alias yayinf="yay -Si"  # Display info about a package in the repositories
