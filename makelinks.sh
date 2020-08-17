#!/bin/bash
#
# Create all the links to config files I may want on a new system

set -euo pipefail
# set -x

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

link () {
    what="$dir"/"$1"
    where=$2

    if [ ! -e "$what" ]; then
        echo "source not found: '$what'" >&2
        exit 1
    fi

    if [ -L "$where" ] && [ ! -e "$where" ]; then
        echo "broken link: '$where'" >&2
        exit 1
    fi

    if [ -e "$where" ]; then
        echo "file exists: '$where'" >&2
        return
    fi

    d=$(dirname "$where")
    if [ ! -d "$d" ]; then
        mkdir -vp "$d"
    fi

    ln -sv "$what" "$where"
}


link bash_aliases ~/.bash_aliases
link bash_completion ~/.bash_completion
link ackrc ~/.ackrc
link git/gitconfig ~/.gitconfig
link git/gitignore ~/.gitignore
link git/git_template ~/.git_template
link hg/hgrc ~/.hgrc
link less/lessfilter ~/.lessfilter
link psqlrc ~/.psqlrc
link sqliterc ~/.sqliterc
link tmux.conf ~/.tmux.conf
link vim ~/.vim
link vim/vimrc ~/.vimrc
link gdbinit ~/.gdbinit
link darcs/defaults ~/.darcs/defaults
link xsession/xsession ~/.xsession
link flake8 ~/.config/flake8
link i3/config ~/.config/i3/config
link i3/i3blocks/ ~/.config/i3blocks
