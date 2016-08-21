# $HOME/local
if [ -d $HOME/local/bin ]; then
    export PATH=$HOME/local/bin:$PATH
fi
# $HOME
if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi
# GO
export GOPATH=$HOME/go
if [ -d $GOPATH ]; then
    export GOBIN=$GOPATH/bin
    export PATH=$PATH:$GOPATH/bin
fi
#typeset -U path PATH
