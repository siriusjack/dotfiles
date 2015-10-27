# path.zsh
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
if [ -d $HOME/local/bin ]; then
    export PATH=$HOME/local/bin:$PATH
fi
if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi
