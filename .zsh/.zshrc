# .zsh/.zshrc
# # profiling
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

# zplug plugins
if [ -f ${HOME}/.zplug/innit.zsh ]; then
    source ~/.zplug/init.zsh
    zplug "felixr/docker-zsh-completion"
    zplug load --verbose
fi

# --- basic settings --- 
setopt auto_cd
# ignore duplicated history 
setopt hist_ignore_dups
# This makes cd=pushd
setopt auto_pushd
# activate zmv
autoload -Uz zmv
alias zmv='noglob zmv -W'
# Spell check comands (maybe annoying -> set no)
setopt nocorrect
# Suppress beeps (annnoying)
setopt nobeep
setopt nolistbeep
# Emacs keybind (Supergeil XD!)
bindkey -e
# colors
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# lprompt 
_load_library $ZDOTDIR/lprompt.zsh 
# rprompt
_load_library $ZDOTDIR/rprompt.zsh
# history
_load_library $ZDOTDIR/history.zsh
# ---/basic settings --- 

# path
_load_library $ZDOTDIR/path.zsh
_load_library $ZDOTDIR/path_local.zsh
_load_library $ZDOTDIR/envtools.zsh

# optionals
_load_library $ZDOTDIR/completion.zsh
_load_library $ZDOTDIR/completion_local.zsh
_load_library $ZDOTDIR/aliases.zsh

# toolwise settings
if _command_exists rmtrash; then
    _load_library $ZDOTDIR/rmtrash.zsh
fi
if _command_exists peco; then 
    _load_library $ZDOTDIR/peco.zsh
fi
if _command_exists tmux; then
    _load_library $ZDOTDIR/tmux.zsh
fi

# Profiling
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi
