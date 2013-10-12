# loading aliases
[[ -s ~/.bash.alias ]] && source ~/.bash.alias

# load local settings
[[ -s ~/.bashrc.local ]] && source ~/.bashrc.local


# set pystartup
export PYTHONSTARTUP=${HOME}/.pystartup

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'

# settings for vim
# export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
# alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
