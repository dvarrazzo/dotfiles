#!/bin/bash
#
# Create all the links to config files I may want on a new system

ln -s etc/bash_aliases .bash_aliases
ln -s etc/bash_completion .bash_completion
ln -s etc/ackrc .ackrc
ln -s etc/git/gitconfig .gitconfig
ln -s etc/git/gitignore .gitignore
ln -s etc/git/git_template .git_template
ln -s etc/hg/hgrc .hgrc
ln -s etc/less/lessfilter .lessfilter
ln -s etc/psqlrc .psqlrc
ln -s etc/sqliterc .sqliterc
ln -s etc/tmux.conf .tmux.conf
ln -s etc/vim .vim
ln -s etc/vim/vimrc .vimrc
ln -s etc/gdbinit .gdbinit
mkdir -p .darcs
ln -s ~/etc/darcs/defaults .darcs/
ln -s etc/xsession/xsession .xsession
mkdir -p .config
ln -s ~/etc/flake8 .config/
mkdir -p .config/i3
ln -s ~/etc/i3/config .config/i3/
