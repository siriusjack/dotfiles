# .zsh/env_tools.zsh
local uname=`uname`


# ----- ENV TOOLS ----- 
if [ -d $HOME/.anyenv ]; then
    export PATH=$HOME/.anyenv/bin:$PATH
    eval "$(anyenv init -)"
fi

# # direnv
# if _command_exists direnv; then
#     eval "$(direnv hook zsh)"
# fi

# python [pythonz]
# if [ -s $HOME/.pythonz/etc/bashrc ]; then
#     source $HOME/.pythonz/etc/bashrc
# fi

## python [pyenv]
#if [ -d $HOME/.pyenv ]; then
#    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
#    if [ $uname != 'Darwin' ]; then
#        export PYENV_ROOT=$HOME/.pyenv
#        export PATH=$PYENV_ROOT/bin:$PATH
#    fi
#    eval "$(pyenv init -)"
#fi
#
## ruby [rbenv]
#if [ -d $HOME/.rbenv ]; then
#    if [ $uname != 'Darwin' ]; then
#        export PATH=$HOME/.rbenv/bin:$PATH
#    fi
#fi
#if _command_exists rbenv; then
#    eval "$(rbenv init -)"
#fi
#
## node.js [nodebrew]
#if [ -d $HOME/.nodebrew ]; then
#    export PATH=$HOME/.nodebrew/current/bin:$PATH
#fi
#
## go [gvm]
#if [ -d $HOME/.gvm ]; then
#    source $HOME/.gvm/scripts/gvm
#fi

#//----- ENV TOOLS ----- 
