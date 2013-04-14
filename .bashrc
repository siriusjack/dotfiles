# loading aliases
[[ -s ~/.alias ]] && source ~/.alias

# set pystartup
export PYTHONSTARTUP=${HOME}/.pystartup

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'

# settings for openform --------------------------///
alias of21='hdiutil attach $HOME/OPENFOAM-v2.1.sparseimage; . $HOME/OpenFOAM/OpenFOAM-2.1.0/etc/bashrc'

# settings for sage -----------------------------///
alias sage='/Applications/Sage-5.8-OSX-64bit-10.8.app/Contents/Resources/sage/sage'


echo "Welcome to the Unix world!"
