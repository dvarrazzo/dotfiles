export PAGER="/usr/bin/less -R"
alias less='less -R'
export LESSCOLOR=always
export EDITOR=vim
export PGAPPNAME=$USER@$(hostname)

alias ll='ls -l'
alias grep='grep --color=auto -I'
alias egrep='egrep --color=auto -I'
alias rvim='gvim --remote-silent'
alias ack='ack-grep'

# date order
alias gitk='gitk -d'
alias indent='sed -e "s/^\(.*\)/    \1/"'
