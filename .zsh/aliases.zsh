# zsh
# common settings
alias a='ls -l'
alias l='ls -lh'
alias ll='ls -l'
alias la='ls -lah'

# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
 
# cdr の設定
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

# file extentions
alias -s py=python
alias -s rb=ruby
alias -s js=node
alias -s hs=runghc
alias -s txt=cat

# ----- Homebrew -----
alias b='brew'
alias bs='brew -S'
alias bi='brew info'
alias bl='brew list'

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
