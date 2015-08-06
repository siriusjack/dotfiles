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
    if [ $uname != 'Darwin' ]; then
        export PATH=$HOME/.nodebrew/current/bin:$PATH
    fi
fi

# init env tools
if _command_exists pyenv; then
    eval "$(pyenv init -)"
fi
if _command_exists pyenv-virtualenv-init; then 
    eval "$(pyenv virtualenv-init -)"
fi
if _command_exists rbenv; then
    eval "$(rbenv init -)"
fi
#typeset -U path PATH
