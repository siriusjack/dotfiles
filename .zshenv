# Basic settings
export LANG=en_US.UTF-8
export EDITOR=vim
export LESSCHARSET=utf-8
export ZDOTDIR=$HOME/.zsh
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

local hostname=`hostname`

case $hostname in
    # on macbook
    mb*)
    fpath=(/usr/local/share/zsh-completions $fpath)
    ;;
    # on laurel
    ap-*)
        fpath=($HOME/local/share/zsh/5.0.7/functions $fpath)
        LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
        INCLUDE=${HOME}/local/include:$INCLUDE
        PKG_CONFIG_PATH=/usr/lib/pkgconfig:$HOME/local/lib/pkgconfig
        ;;
    # on camphor
    "www21453ue.sakura.ne.jp")
        LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
        INCLUDE=$HOME/local/include:$INCLUDE
        PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig:/usr/lib/pkgconfig
    ;;
    # on es16
    "es16")
        export LD_LIBRARY_PATH=${HOME}/.local/lib:$LD_LIBRARY_PATH
        export INCLUDE=${HOME}/.local/include:$INCLUDE
        export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:/usr/lib/pkgconfig
        # opencl
        export GPU_FORCE_64BIT_PTR=0
        export GPU_USE_SYNC_OBJECTS=1
        export GPU_MAX_HEAP_SIZE=100
        export GPU_MAX_ALLOC_PERCENT=100
        export GPU_SINGLE_ALLOC_PERCENT=100
    ;;
    # on else
    *)
    ;;
esac

# PATH
typeset -U path
typeset -U cdpath
typeset -U fpath
typeset -U manpath
typeset -U pkg_config_path
[ -z "$cpath"]            && typeset -T CPATH cpath
[ -z "$ls_library_path" ] && typeset -T LD_LIBRARY_PATH ld_library_path
[ -z "$include" ]         && typeset -T INCLUDE include
[ -z "$pkg_config_path" ] && typeset -T PKG_CONFIG_PATH pkg_config_path
typeset -U cpath 
typeset -U ld_library_path
typeset -U include
typeset -U pkg_config_path
