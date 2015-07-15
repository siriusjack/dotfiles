# .zsh/history.zsh
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
bindkey '^R' history-incremental-search-backward
