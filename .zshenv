#
# $B4pK\@_Dj(B
#
export LANG=ja_JP.UTF-8
export EDITOR=vim
export ZDOTDIR=$HOME/.zsh
#
# $B%[%9%HJL$N@_Dj(B(PATH, etc...)
#
case $HOSTNAME in
    # on laurel
    ap-*)
        fpath=($HOME/local/share/zsh/5.0.7/functions $fpath)
        LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH
        INCLUDE=${HOME}/local/include:$INCLUDE
        PKG_CONFIG_PATH=/usr/lib/pkgconfig:$HOME/local/lib/pkgconfig
        ;;
    # on camphor
    "www21453ue.sakura.ne.jp")
        LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH
        INCLUDE=${HOME}/local/include:$INCLUDE
        PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig:/usr/lib/pkgconfig
    ;;
    # on else
    *)
        #export LC_ALL=en_US.UTF-8
        #export LANG=en_US.UTF-8
        ;;
esac
#
# PATH $BBgJ8;z(B/$B>.J8;z$N$R$bIU$1(B
#
typeset -T CPATH cpath
[ -z "$ls_library_path" ] && typeset -T LD_LIBRARY_PATH ld_library_path
[ -z "$include" ] && typeset -T INCLUDE include
[ -z "$pkg_config_path" ] && typeset -T PKG_CONFIG_PATH pkg_config_path
#
# PATH$B$N=EJ#$r:o=|(B
# 
typeset -U path cdpath fpath manpath
typeset -U ld_library_path include pkg_config_path
