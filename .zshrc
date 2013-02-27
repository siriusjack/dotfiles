#
# ~/.zshrc
#

#path for rbenv
#reference: http://qiita.com/items/9dd797f42e7bea674705
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
export CC=/usr/bin/gcc


# prompt
#autoload -U colors
#colors
PROMPT='%c %# '
# RPROMPT='%d'

# completion
autoload -U compinit
compinit
setopt correct
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups

# alias
alias rm='rm -i'
alias ls='ls -a'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'
alias -g W='| wc'
alias -g X='| xargs'
