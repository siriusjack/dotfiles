# .zsh/env_tools.zsh
local uname=`uname`

# direnv
if _command_exists direnv; then
    eval "$(direnv hook zsh)"
fi

# python [pythonz|pyenv]
# pythonz
if [ -s $HOME/.pythonz/etc/bashrc ]; then
    source $HOME/.pythonz/etc/bashrc
fi
# pyenv
if [ -d $HOME/.pyenv ]; then
    if [ $uname != 'Darwin' ]; then
        export PYENV_ROOT=$HOME/.pyenv
        export PATH=$PYENV_ROOT/bin:$PATH
    fi
fi
if _command_exists pyenv; then
    eval "$(pyenv init -)"
    if [ -d $PYENV_ROOT/plugins/pyenv-virtualenv ]; then
        eval "$(pyenv virtualenv-init -)"
    elif _command_exists pyenv-virtualenv; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# ruby [rbenv]
if [ -d $HOME/.rbenv ]; then
    if [ $uname != 'Darwin' ]; then
        export PATH=$HOME/.rbenv/bin:$PATH
    fi
fi
if _command_exists rbenv; then
    eval "$(rbenv init -)"
fi

# node.js [nodebrew]
if [ -d $HOME/.nodebrew ]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# go [gvm]
if [ -d $HOME/.gvm ]; then
    source $HOME/.gvm/scripts/gvm
fi

#typeset -U path PATH
