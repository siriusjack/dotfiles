# .zsh/alias.zsh
# if _command_exists nvim ; then alias vim=nvim ; fi

# ----- extentions -----
alias -s py=python
alias -s rb=ruby
alias -s js=node
alias -s hs=runghc
alias -s txt=cat

# ----- git -----
alias g=git
alias gp='git push'
alias gc='git cm'
alias ga='git add'

# ----- util -----
function gpath() {
    echo ${PWD/#$HOME/\~} | tr -d '\n' | pbcopy
}
function gdatetime() {
    date +%Y-%m-%d\ %H.%M.%S | tr -d '\n' | pbcopy
}
function gdate() {
    date +%Y-%m-%d | tr -d '\n' | pbcopy
}

function ls_abbrev() {
    if [[ ! -r $PWD ]]; then
        return
    fi
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-l' '--color')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='gls'
            else
                opt_ls=('-l' '-G')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')
    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')
    local num_files=`ls -1 -A | wc -l | tr -d '\ '`
    echo ""
    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
    else
        echo $ls_result
    fi
    echo "$num_files files exist"
    echo ""
}

function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    ls_abbrev
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo -e "\e[0;33m ----- git status -----\e[0m"
        git status -sb
        echo ""
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter

function cdup() {
   echo
   cd ..
   zle reset-prompt
}
zle -N cdup

# ----- key-binds -----
bindkey '^m' do_enter
bindkey '^b' cdup
bindkey '^J' self-insert


# hostwise settings
local hostname=`hostname`
case $hostname in 
    ap-*)
        unalias rm
        unalias cp
        unalias mv
        ;;
    *)
esac

# os wise settings
local uname=`uname`
if [ $uname = 'Darwin' ]; then
    # ----- ls -----
    alias ls='ls -G'
    alias ll='ls -G -lh'
    alias la='ls -G -lah'
    alias l='ls -G -lh'
    alias a='ls -G -a'
    # ----- open -----
    alias o='open'
    # ----- vim -----
    alias v=vim
    alias gvim=mvim
    # ----- chem -----
    alias aten=/Applications/Aten.app/Contents/MacOS/Aten
    alias avogadro=/Applications/Avogadro.app/Contents/MacOS/Avogadro
elif [ $uname = 'Linux' ]; then
    alias ls='ls --color' 
    alias ll='ls --color -lh'
    alias la='ls --color -lah'
    alias a='ls --color -ah'
    alias l='ls --color -lh'
    alias open='nautilus'
    alias o='open'
fi
