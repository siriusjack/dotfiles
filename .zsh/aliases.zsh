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

# ----- peco -----
if [ -x "`which peco`" ]; then;
    function peco-select-history() {
        local tac
        if which tac > /dev/null; then
            tac="tac"
        else
            tac="tail -r"
        fi
        BUFFER=$(\history -n 1 | \
            eval $tac | \
            peco --query "$LBUFFER")
        CURSOR=$#BUFFER
        zle clear-screen
    }
    zle -N peco-select-history
    bindkey '^r' peco-select-history
    

    function peco-kill-process () {
        ps -ef | peco | awk '{ print $2 }' | xargs kill
        zle clear-screen
    }
    zle -N peco-kill-process
    bindkey '^xk' peco-kill-process #C-x k

    function peco-cdr () {
        local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
        if [ -n "$selected_dir" ]; then
            BUFFER="cd ${selected_dir}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N peco-cdr
    bindkey '^xb' peco-cdr
    # git-ignore ruby
    function git-ignore() {
        curl -s https://www.gitignore.io/api/$@;
    }

    # $ git-ignore-list
    function git-ignore-list() {
        local langs=$(git-ignore list | tr ',' '\n'| peco --query "$1" | tr "\n", ",")
        [ -n "$langs" ] && git-ignore ${langs%,}
    }
fi

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
