# .zsh/.zshrc
# profiling
# zmodload zsh/zprof && zprof

# utility functions
function _command_exists() {
    hash "$1" 2>/dev/null
}
function _load_library() {
    if [ -f $1 ]; then
        source $1
    elif [ -s $1 ]; then
        source $1
    fi
}

# plugins
#_load_library $ZDOTDIR/plugins/oh-my-zsh.zsh
#_load_library $ZDOTDIR/plugins/zsh-python-prompt/zshrc.zsh
#_load_library $ZDOTDIR/plugins/zsh-python-prompt.zsh

setopt auto_cd
setopt auto_pushd
setopt correct
setopt nobeep
setopt nolistbeep
bindkey -e

# ls colors
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 

# prompt
# [user@host]
local p_uh="%(?.%F{green}.%F{magenta})%n@%m%f${WINDOW+[$WINDOW]}"
# current dir
local p_cd="%F{cyan}%~%f"
# prefix
local p_pr="%(!,#,$)"
# prompt
PROMPT="[$p_uh $p_cd]
$p_pr "

# path
_load_library $ZDOTDIR/path.zsh
_load_library $ZDOTDIR/path_local.zsh
_load_library $ZDOTDIR/completion.zsh
_load_library $ZDOTDIR/completion_local.zsh
_load_library $ZDOTDIR/aliases.zsh
_load_library $ZDOTDIR/aliases_local.zsh
_load_library $ZDOTDIR/history.zsh

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
#if (which zprof > /dev/null) ;then
#  zprof | less
#fi
