# .zshrc
function _command_exists() {
    hash "$1" 2>/dev/null
}

function _load_if_command_exists() {
	
}

function _load_library() {
    if [ -f $1 ]; then
        . $1
    fi
    if [ -s $1 ]; then
    	. $1
    fi
}

# oh-my-zsh
_load_library $ZDOTDIR/plugins/oh-my-zsh.zsh

# legacy settings
_load_library $HOME/.bashrc.path
_load_library $HOME/.bashrc.path.local
_load_library $HOME/.bashrc.alias

# path
_load_library $ZDOTDIR/path.zsh

# completion
_load_library $ZDOTDIR/completion.zsh

# aliases
_load_library $ZDOTDIR/aliases.zsh
_load_library $ZDOTDIR/aliases_local.zsh

if _command_exists peco; then
	_load_library $ZDOTDIR/aliases_peco.zsh
fi

# other plugins
_load_library $ZDOTDIR/plugins/zsh-python-prompt/zshrc.zsh
_load_library $ZDOTDIR/plugins/zsh-python-prompt.zsh
