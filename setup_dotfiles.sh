#!/bin/bash

DOT_FILES=(\
# git
    .gitconfig\
    .gitignore_global\
    .tmux.conf\
    .vim\
    .vimrc\
    .bundle\
    .zshenv\
    .zsh\
)

for file in ${DOT_FILES[@]}
do
    ln -s ${HOME}/dotfiles/${file} ${HOME}/${file}
done
