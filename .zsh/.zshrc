# .zsh/.zshrc
# # profiling
# zmodload zsh/zprof && zprof

# utility func
function _command_exists() {
    hash "$1" 2>/dev/null
}
function _load_library() {
    if [ -f $1 -o -s $1 ] && source $1
}

# --- basic settings ---
# compile
if [ $DOTFILES/.zshrc -nt ~/.zshrc.zwc ]; then zcompile ~/.zshrc ; fi
# lprompt 
_load_library $ZDOTDIR/lprompt.zsh 
# rprompt
_load_library $ZDOTDIR/rprompt.zsh
# Auto_cd
setopt auto_cd
# Makes cd=pushd
setopt auto_pushd
# Ignore duplicated history 
setopt hist_ignore_dups
# spell check comands (maybe annoying -> set no)
setopt nocorrect
# Suppress beeps (annnoying)
setopt nobeep
setopt nolistbeep
# Emacs keybind (Supergeil XD!)
bindkey -e
# colors
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# path
_load_library $ZDOTDIR/path.zsh
# alias
_load_library $ZDOTDIR/aliases.zsh
# ---/basic settings --- 

# zplug
if [ -f ${HOME}/.zplug/init.zsh -o -s ${ZDOTDIR:-HOME}/.zplug/init.zsh ]; then
    # source init
    source ${HOME}/.zplug/init.zsh
    #zplug "b4b4r07/zplug" # self && zplug update
    #zplug "sorin-ionescu/prezto", \
    #     use:init.zsh, \
    #     hook-build:"ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto $ZDOTDIR/.zprezto"
    #plug "felixr/docker-zsh-completion"
    zplug "zsh-users/zsh-completions"
    zplug "zsh-users/zsh-syntax-highlighting", nice:10
    zplug "felixr/docker-zsh-completion"
    zplug load --verbose
fi

# toolwise settings
if _command_exists tmux    ; then _load_library $ZDOTDIR/tmux.zsh    ;fi
if _command_exists peco    ; then _load_library $ZDOTDIR/peco.zsh    ;fi
if _command_exists rmtrash ; then _load_library $ZDOTDIR/rmtrash.zsh ;fi
# cdr
_load_library $ZDOTDIR/cdr.zsh
# completion
# _load_library $ZDOTDIR/completion.zsh
# history
_load_library $ZDOTDIR/history.zsh

# # Profiling
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi
