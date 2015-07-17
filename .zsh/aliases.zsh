# .zsh/alias.zsh

# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
 
# cdr の設定
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

# 単なるAlias
local uname=`uname`
alias k=tree
if [ $uname = 'Darwin' ]; then
    alias ls='ls -G'
    alias ll='ls -G -lh'
    alias la='ls -G -lah'
    alias l='ls -G -lh'
    alias a='ls -G -lh'
    # ----  vim -----
    alias gvim=mvim
    # ----- Homebrew -----
    alias b='brew'
    alias bs='brew -S'
    alias bi='brew info'
    alias bl='brew list'
elif [ $uname = 'Linux' ]; then
   alias ls='ls --color' 
   alias ll='ls --color -lh'
   alias la='ls --color -lah'
   alias a='ls --color -lh'
   alias l='ls --color -lh'
fi

# file extentions
alias -s py=python
alias -s rb=ruby
alias -s js=node
alias -s hs=runghc
alias -s txt=cat


# ----- util -----
function gpath() {
    pwd | tr -d '\n' | pbcopy
}
function gdatetime() {
    date +%Y-%m-%d\ %H.%M.%S | tr -d '\n' | pbcopy
}
function gdate() {
    date +%Y-%m-%d | tr -d '\n' | pbcopy
}
function getdatetime() {
    date +%Y-%m-%d\ %H.%M.%S | tr -d '\n' | pbcopy
}
