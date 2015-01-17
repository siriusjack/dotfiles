#!/bin/bash

DOT_FILES=(\
	.bashrc\
	.bashrc.alias\
	.bashrc.path\
	.gitconfig\
	.gitignore_global
	.tmux.conf\
	.vim\
	.vimrc\
	.pythonrc.py\
	.gitignore_global\
	.zshenv\
	.zshrc\
	.zshrc.alias\
	.zshrc.path\
)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done


