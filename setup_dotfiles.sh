#!/bin/sh

DOT_FILES=(\
    .bashrc\
    .bashrc.alias\
    .bashrc.path\
    .gitconfig\
    .gitignore_global\
    .tmux.conf\
    .vim\
    .vimrc\
    .pythonrc.py\
    .bundle\
    .zshenv\
    .zsh\
    )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done


