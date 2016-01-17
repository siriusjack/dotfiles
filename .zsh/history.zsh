# .zsh/history.zsh
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=100000

local hist_dir=$HOME/.cache/shell
local hist_file=$hist_dir/chpwd-recent-dirs
if [ ! -d $hist_dir ]; then
    mkdir -p $hist_dir
fi
if [ ! -f $hist_file ]; then
    touch $hist_file
fi

setopt hist_ignore_dups
setopt share_history
bindkey '^R' history-incremental-search-backward
