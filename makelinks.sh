#!/bin/bash
#
# Create all the links to config files I may want on a new system

ln -s etc/bash_aliases .bash_aliases
ln -s etc/ackrc .ackrc
ln -s etc/git/gitconfig .gitconfig
ln -s etc/git/gitignore .gitignore
ln -s etc/hg/hgrc .hgrc
ln -s etc/less/lessfilter .lessfilter
ln -s etc/psqlrc .psqlrc
ln -s etc/sqliterc .sqliterc
ln -s etc/tmux.conf .tmux.conf
ln -s etc/vim .vim
ln -s etc/vim/vimrc .vimrc
mkdir -p .darcs
ln -s ~/etc/darcs/defaults .darcs/

