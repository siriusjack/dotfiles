# .zsh/env_tools.zsh
# load path 
if [ -d $HOME/.pyenv/shims ]; then
    export PATH=$HOME/.pyenv/shims:$PATH
fi
if [ -d $HOME/.rbenv/shims ]; then
    export PATH=$HOME/.rbenv/bin:$PATH
fi
if [ -d $HOME/.nodebrew/current/bin ]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
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
if _command_exists nodebrew; then 
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi
#typeset -U path PATH
