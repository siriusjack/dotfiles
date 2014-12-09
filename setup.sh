#!/bin/bash


DOT_FILES=(\
	.bashrc\
	.bashrc.alias\
	.bashrc.path\
	.emacs\
	.emacs.d\
	.gitconfig\
	.gitignore_global
	.tmux.conf\
	.vim\
	.vimrc\
	.pythonrc.py\
	.gitignore_global
	.zshrc\
)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done


