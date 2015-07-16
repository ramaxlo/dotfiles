# openSUSE alias
alias zi='sudo zypper in'
alias zrm='sudo zypper rm'
alias zu='sudo zypper up'
alias zp='sudo zypper patch'
alias zre='sudo zypper ref'
alias zr='zypper lr'
alias zmr='sudo zypper mr'
alias zar='sudo zypper ar'
alias zse='zypper se'
alias zif='zypper if'
alias rqa='rpm -qa | grep'
alias rqf='rpm -qf'

alias tmux='tmux -2'
alias minicom='LANG=en minicom'
alias less='less -R'

# Git alias
alias gid='git diff'
alias gidc='git diff --cached'
alias gis='git status'
alias gic='git commit'
alias gia='git add'
alias gil='git log'
alias gip='git push'

# Prevent C-s from being interpreted by the terminal
stty -ixon

export PATH=$PATH:~/bin
