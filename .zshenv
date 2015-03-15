#
# $B4pK\@_Dj(B
#
export LANG=ja_JP.UTF-8
export EDITOR=vim
export ZDOTDIR=$HOME/.zsh
#
# $B%[%9%HJL$N@_Dj(B
#
case $HOSTNAME in
    # on laurel
    ap-*)
        fpath=($HOME/local/share/zsh/5.0.7/functions $fpath)
        LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH
        INCLUDE=${HOME}/local/include:$INCLUDE
        PKG_CONFIG_PATH=/usr/lib/pkgconfig:$HOME/local/lib/pkgconfig
        ;;
    # on else
    *)
        ;;
esac

