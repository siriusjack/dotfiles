# .zshrc

# Profiling
zmodload zsh/zprof && zprof

function _command_exists() {
    hash "$1" 2>/dev/null
}
function _load_library() {
    if [ -f $1 ]; then
        . $1
    fi
    if [ -s $1 ]; then
    	. $1
    fi
}

# plugins
_load_library $ZDOTDIR/plugins/oh-my-zsh.zsh
_load_library $ZDOTDIR/plugins/zsh-python-prompt/zshrc.zsh
_load_library $ZDOTDIR/plugins/zsh-python-prompt.zsh

# legacy settings
_load_library $HOME/.bashrc.path
_load_library $HOME/.bashrc.path.local
_load_library $HOME/.bashrc.alias

# path
_load_library $ZDOTDIR/path.zsh
_load_library $ZDOTDIR/path_local.zsh
_load_library $ZDOTDIR/completion.zsh
_load_library $ZDOTDIR/completion_local.zsh
_load_library $ZDOTDIR/aliases.zsh
_load_library $ZDOTDIR/aliases_local.zsh

# Settings for specific tools
if _command_exists rmtrash; then
    _load_library $ZDOTDIR/rmtrash.zsh
fi
if _command_exists peco; then 
    _load_library $ZDOTDIR/peco.zsh
fi
if _command_exists tmux; then
    _load_library $ZDOTDIR/tmux.zsh
fi

# Settings for env tools
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
typeset -U path PATH

# Profiling
if (which zprof > /dev/null) ;then
  zprof | less
fi
