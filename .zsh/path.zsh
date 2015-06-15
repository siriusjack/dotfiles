# path.zsh
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
if [ -d $HOME/local/bin ]; then
    export PATH=$HOME/local/bin:$PATH
fi
if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi
if [ -s $HOME/py3 ]; then
    export PYTHONPATH=$HOME/py3:$PYTHONPATH
    export PATH=$HOME/py3/holy/bin:$PATH
fi
