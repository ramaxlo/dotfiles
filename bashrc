# openSUSE alias
alias zi='sudo zypper in'
alias zrm='sudo zypper rm'
alias zu='sudo zypper up'
alias zp='sudo zypper patch'
alias zre='sudo zypper ref'
alias zr='zypper lr'
alias zmr='sudo zypper mr'
alias zse='zypper se'
alias zif='zypper if'
alias rqa='rpm -qa | grep'

alias tmux='tmux -2'
alias minicom='LANG=en minicom'
alias less='less -R'

# Prevent C-s from being interpreted by the terminal
stty -ixon

export PATH=$PATH:~/bin
