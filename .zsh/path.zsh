case $HOSTNAME in
    # laurel
    ap-*)
    export fpath=($HOME/local/share/zsh/5.0.7/functions $fpath)
    export LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH
    export INCLUDE=${HOME}/local/include:$INCLUDE
    export PKG_CONFIG_PATH=/usr/lib/pkgconfig:$HOME/local/lib/pkgconfig
    ;;

    # camphor
    "www21453ue.sakura.ne.jp")
    export LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH
    export INCLUDE=${HOME}/local/include:$INCLUDE
    export PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig:/usr/lib/pkgconfig
    ;;

    # else
    *)
    ;;
esac

#
# PATH 大文字/小文字のひも付け
#
typeset -T CPATH cpath
[ -z "$ls_library_path" ] && typeset -T LD_LIBRARY_PATH ld_library_path
[ -z "$include" ] && typeset -T INCLUDE include
[ -z "$pkg_config_path" ] && typeset -T PKG_CONFIG_PATH pkg_config_path

#
# PATHの重複を削除
#
typeset -U path cdpath fpath manpath
typeset -U ld_library_path include pkg_config_path
