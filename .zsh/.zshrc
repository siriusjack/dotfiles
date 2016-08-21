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
# zplug
if [ -f ${ZDOTDIR:-HOME}/.zplug/init.zsh -o -s ${ZDOTDIR:-HOME}/.zplug/init.zsh ]; then
	# source init
	source ${ZDOTDIR:-HOME}/.zplug/init.zsh
	# zplug
	zplug "b4b4r07/zplug" # self && zplug update
	# prezto
	zplug "sorin-ionescu/prezto", \
		use:init.zsh, \
		hook-build:"ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto $ZDOTDIR/.zprezto"
	# docker-zsh-completion
	zplug "felixr/docker-zsh-completion"
	# zplug confirmation
	if ! zplug check --verbose; then
	  printf 'Install? [y/N]: '
	  if read -q; then
	    echo; zplug install
	  fi
	fi
	# zplug load
	zplug load --verbose
fi

# path
_load_library $ZDOTDIR/path.zsh
_load_library $ZDOTDIR/envtools.zsh

# toolwise settings
if _command_exists tmux    ; then _load_library $ZDOTDIR/tmux.zsh    ;fi
if _command_exists peco    ; then _load_library $ZDOTDIR/peco.zsh    ;fi
if _command_exists rmtrash ; then _load_library $ZDOTDIR/rmtrash.zsh ;fi
# alias
_load_library $ZDOTDIR/aliases.zsh
# cdr
_load_library $ZDOTDIR/cdr.zsh
# completion
# _load_library $ZDOTDIR/completion.zsh
# # history
# _load_library $ZDOTDIR/history.zsh
# # lprompt 
# _load_library $ZDOTDIR/lprompt.zsh 
# # rprompt
# _load_library $ZDOTDIR/rprompt.zsh

# --- basic settings ---
# Auto_cd
setopt auto_cd
# Makes cd=pushd
setopt auto_pushd
# Ignore duplicated history 
setopt hist_ignore_dups
# Activate zmv
# autoload -Uz zmv
# alias zmv='noglob zmv -W'
# Spell check comands (maybe annoying -> set no)
setopt nocorrect
# Suppress beeps (annnoying)
setopt nobeep
setopt nolistbeep
# Emacs keybind (Supergeil XD!)
bindkey -e
# colors
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# ---/basic settings --- 

# # Profiling
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi