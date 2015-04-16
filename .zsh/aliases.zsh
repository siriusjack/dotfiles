# zsh
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
alias -s txt=cat

# Homebrew #
alias b='brew'
alias bs='brew -S'
alias bi='brew info'
alias bl='brew list'

# ----- util -----
function getpath() {
    pwd | tr -d '\n' | pbcopy
}
function getdatetime() {
    date +%Y-%m-%d\ %H.%M.%S | tr -d '\n' | pbcopy
}
function getdate() {
    date +%Y-%m-%d | tr -d '\n' | pbcopy
}

# ----- tmux -----
autoload -Uz add-zsh-hook

function rename_tmux_window() {
   if [ $TERM = "screen" ]; then
       local current_path=`pwd`
       local current_dir=`basename $current_path`
       tmux rename-window $current_dir
   fi
}

add-zsh-hook precmd rename_tmux_window
