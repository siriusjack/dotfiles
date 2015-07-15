# These are utility aliases depending on peco
# ----- peco -----
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


function peco-cd () {
    local selected_dir=$(ls -lhd */ | peco | awk '{print $9}')
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cd
bindkey '^fe' peco-cd


# git-ignore ruby
function git-ignore() {
    curl -s https://www.gitignore.io/api/$@;
}


# $ git-ignore-list
function git-ignore-list() {
    local langs=$(git-ignore list | tr ',' '\n'| peco --query "$1" | tr "\n", ",")
    [ -n "$langs" ] && git-ignore ${langs%,}
}
