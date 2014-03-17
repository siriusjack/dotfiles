# loading
[[ -s ~/.bashrc.alias ]] && source ~/.bashrc.alias
[[ -s ~/.bashrc.local ]] && source ~/.bashrc.local

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias del='gmv -f --backup=numbered --target-directory ~/.Trash'

export PYTHONSTARTUP=~/.pythonrc.py
