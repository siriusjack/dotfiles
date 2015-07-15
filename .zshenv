# 基本設定
export LANG=en_US.UTF-8
export EDITOR=vim
export ZDOTDIR=$HOME/.zsh
export PATH=/usr/local/bin:/usr/local/sbin:$PATH


# ホスト別の設定(PATH, etc...)
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


# PATHの重複を削除
typeset -U path
typeset -U cdpath
typeset -U fpath
typeset -U manpath
# PATH 大文字/小文字ひも付け -> 重複削除
[ -z "$cpath"]            && typeset -T CPATH cpath
[ -z "$ls_library_path" ] && typeset -T LD_LIBRARY_PATH ld_library_path
[ -z "$include" ]         && typeset -T INCLUDE include
[ -z "$pkg_config_path" ] && typeset -T PKG_CONFIG_PATH pkg_config_path
typeset -U cpath 
typeset -U ld_library_path
typeset -U include
typeset -U pkg_config_path
