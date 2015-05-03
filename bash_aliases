export PAGER="/usr/bin/less -R"
alias less='less -R'
# export LESSCOLOR=always

export EDITOR=vim
export PGAPPNAME=$USER@$(hostname)
export PG_REGRESS_DIFF_OPTS=-u

# Avoid "WARNING **: Unable to create Ubuntu Menu Proxy" starting gvim
export UBUNTU_MENUPROXY=

# NAAAAAHHH... CDPATH!
CDPATH=".:~/dev:~:~/dev/fs"

alias ll='ls -l'
alias grep='grep --color=auto -I'
alias egrep='egrep --color=auto -I'
alias rvim='gvim --remote-silent'
alias ack='ack-grep'
alias gk="gitk --all -d &"
alias indent='sed -e "s/^\(.*\)/    \1/"'

# edit the previous ag result with "e N"
ag_and_vi() {
    LINE=$1
    SEARCH=ag
    CMD=$(history 10 | egrep "\s*[0-9]+\s+${SEARCH}\s+" | tail -1 | sed -e 's/^\s*[0-9]\+\s\+\(.*\)$/\1/')
    $(${CMD} | sed -n -e "${LINE}p" | sed -e 's/^\([^:]*\):\([0-9]\+\):\(.*\)$/vim \1 +\2/')
}
alias e=ag_and_vi

# vim: set filetype=sh:
