export PAGER="/usr/bin/less -R"
alias less='less -R'
# export LESSCOLOR=always

export EDITOR=vim
export PGAPPNAME=$USER@$(hostname)

# Avoid "WARNING **: Unable to create Ubuntu Menu Proxy" starting gvim
export UBUNTU_MENUPROXY=

alias ll='ls -l'
alias grep='grep --color=auto -I'
alias egrep='egrep --color=auto -I'
alias rvim='gvim --remote-silent'
alias ack='ack-grep'
alias gk="gitk --all -d &"
alias indent='sed -e "s/^\(.*\)/    \1/"'


# vim: set filetype=sh:
