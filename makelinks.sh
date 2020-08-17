#!/bin/bash
#
# Create all the links to config files I may want on a new system

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$dir/.."

ln -s $dir/bash_aliases .bash_aliases
ln -s $dir/bash_completion .bash_completion
ln -s $dir/ackrc .ackrc
ln -s $dir/git/gitconfig .gitconfig
ln -s $dir/git/gitignore .gitignore
ln -s $dir/git/git_template .git_template
ln -s $dir/hg/hgrc .hgrc
ln -s $dir/less/lessfilter .lessfilter
ln -s $dir/psqlrc .psqlrc
ln -s $dir/sqliterc .sqliterc
ln -s $dir/tmux.conf .tmux.conf
ln -s $dir/vim .vim
ln -s $dir/vim/vimrc .vimrc
ln -s $dir/gdbinit .gdbinit
mkdir -p .darcs
ln -s $dir/darcs/defaults .darcs/
ln -s $dir/xsession/xsession .xsession
mkdir -p .config
ln -s $dir/flake8 .config/
mkdir -p .config/i3
ln -s $dir/i3/config .config/i3/
ln -s $dir/i3/i3blocks/ .config/i3blocks
