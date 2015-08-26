# .zsh/env_tools.zsh
local uname=`uname`

# load path 
if [ -d $HOME/.pyenv ]; then
    if [ $uname != 'Darwin' ]; then
        export PYENV_ROOT=$HOME/.pyenv
        export PATH=$PYENV_ROOT/bin:$PATH
    fi
fi
if [ -d $HOME/.rbenv ]; then
    if [ $uname != 'Darwin' ]; then
        export PATH=$HOME/.rbenv/bin:$PATH
    fi
fi
if [ -d $HOME/.nodebrew ]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# init env tools
if _command_exists pyenv; then
    eval "$(pyenv init -)"
    if [ -d $PYENV_ROOT/plugins/pyenv-virtualenv ]; then
        eval "$(pyenv virtualenv-init -)"
    elif _command_exists pyenv-virtualenv; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi
if _command_exists rbenv; then
    eval "$(rbenv init -)"
fi
#typeset -U path PATH
