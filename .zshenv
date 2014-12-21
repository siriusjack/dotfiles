LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH
INCLUDE=${HOME}/local/include:$INCLUDE
PKG_CONFIG_PATH=/usr/lib/pkgconfig:$HOME/local/lib/pkgconfig

[ -z "$ls_library_path" ] && typeset -T LD_LIBRARY_PATH ld_library_path
[ -z "$include" ] && typeset -T INCLUDE include
[ -z "$pkg_config_path" ] && typeset -T PKG_CONFIG_PATH pkg_config_path

typeset -U path cdpath fpath manpath ld_library_path include pkg_config_path
