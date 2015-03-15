# zshrc
function _load_library() {
    if [ -f $1 ]; then
        . $1
    fi
    if [ -s $1 ]; then
    	. $1
    fi
}

#
# load other files 
#
_load_library $HOME/.bashrc.path
_load_library $HOME/.bashrc.path.local
_load_library $HOME/.bashrc.alias

_load_library $ZDOTDIR/path.zsh
_load_library $ZDOTDIR/completion.zsh
_load_library $ZDOTDIR/aliases.zsh