#! /bin/zsh

# Enable autocompleting alias commands
setopt COMPLETEALIASES
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
# Print a simple colormap.
alias colormap='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+"\n"}; done'
