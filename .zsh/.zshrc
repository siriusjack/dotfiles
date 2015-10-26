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

#---  basic settings --- 
setopt auto_cd
# ignore duplicated history 
setopt hist_ignore_dups
# This make s cd=pushd
setopt auto_pushd
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
# [user@host]
local p_uh="%(?.%F{green}.%F{magenta})%n@%m%f${WINDOW+[$WINDOW]}"
# current dir
local p_cd="%F{cyan}%~%f"
# prefix
local p_pr="%(!,#,$)"
# prompt
PROMPT="[$p_uh $p_cd]
$p_pr "

# rprompt
_load_library $ZDOTDIR/rprompt.zsh

# history
_load_library $ZDOTDIR/history.zsh

# path
_load_library $ZDOTDIR/path.zsh
_load_library $ZDOTDIR/path_local.zsh
_load_library $ZDOTDIR/envtools.zsh

# optionals
_load_library $ZDOTDIR/completion.zsh
_load_library $ZDOTDIR/completion_local.zsh
_load_library $ZDOTDIR/aliases.zsh
_load_library $ZDOTDIR/aliases_local.zsh

# tool depended settings
if _command_exists rmtrash; then
    _load_library $ZDOTDIR/rmtrash.zsh
fi
if _command_exists peco; then 
    _load_library $ZDOTDIR/peco.zsh
fi
if _command_exists tmux; then
    _load_library $ZDOTDIR/tmux.zsh
fi

# plugins
#_load_library $ZDOTDIR/plugins/oh-my-zsh.zsh
#_load_library $ZDOTDIR/plugins/zsh-python-prompt/zshrc.zsh
#_load_library $ZDOTDIR/plugins/zsh-python-prompt.zsh

# Profiling
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi
