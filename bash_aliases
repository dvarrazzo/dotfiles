export PAGER="/usr/bin/less -R"
alias less='less -R'
# export LESSCOLOR=always

export EDITOR=vim
export PGAPPNAME=$USER@$(hostname)
export PG_REGRESS_DIFF_OPTS=-u
export PSPG="--style=16"

# Avoid "WARNING **: Unable to create Ubuntu Menu Proxy" starting gvim
export UBUNTU_MENUPROXY=

# NAAAAAHHH... CDPATH!
CDPATH=".:~/dev:~:~/dev/fs"
export PATH=/home/piro/etc/bin:$PATH

alias ll='ls -l'
alias grep='grep --color=auto -I'
alias egrep='egrep --color=auto -I'
alias rvim='gvim --remote-silent'
alias ack='ack-grep'
alias g="git"
alias gk="gitk --all -d &"
alias indent='sed -e "s/^\(.*\)/    \1/"'
alias d='docker'
alias dr='docker run -it --rm'
alias dc='docker-compose'
alias s='source .venv/bin/activate'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# edit the previous ag result with "e N"
ag_and_vi() {
    LINE=$1
    SEARCH=ag
    CMD=$(history 10 | egrep "\s*[0-9]+\s+${SEARCH}\s+" | tail -1 | sed -e 's/^\s*[0-9]\+\s\+\(.*\)$/\1/')
    $(bash -c "${CMD}" | sed -n -e "${LINE}p" | sed -e "s/^\([^:]*\):\([0-9]\+\):\(.*\)$/${EDITOR} \1 +\2/")
}
alias e=ag_and_vi

# mkdir and cd together
# http://linux.101hacks.com/cd-command/mkdir-and-cd-together/
mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
alias mcd=mkdircd

# Generate a random password
alias mkpass="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1"

# Set the terminal title. Reset to default if used with no argument.
function title () {
  if [[ -z "$ORIG_PS1" ]]; then
    ORIG_PS1=$PS1
  fi

  if [[ -n "$1" ]]; then
      TITLE="\[\e]2;$* (\w)\a\]"
      PS1="${ORIG_PS1}${TITLE}"
  else
      PS1="${ORIG_PS1}"
      unset ORIG_PS1
  fi
}

# Kill an orphaned ssh-agent session
# trap 'egrep -q "^Name:\s+ssh-agent" /proc/$SSH_AGENT_PID/status 2>/dev/null && eval `/usr/bin/ssh-agent -k`' 0

# Use ag to feed fzf in order to avoid gitignored crap
export FZF_DEFAULT_COMMAND='ag -g ""'

test -f /usr/share/doc/fzf/examples/key-bindings.bash && source /usr/share/doc/fzf/examples/key-bindings.bash

# direnv
eval "$(direnv hook bash)"

# vim: set filetype=sh:
