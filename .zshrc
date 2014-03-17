# 色を使用できるようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


export PATH=~/bin:$PATH
# settings for homebrew
export HOMEBREW_GITHUB_API_TOKEN=493c73f23a381ef4d92453071e2b6d8bbe7a5fb2


# settings for KVS
export KVS_DIR=/usr/local/kvs
export PATH=$KVS_DIR/bin:$PATH
# export LD_LIBRARY_PATH=/usr/local/kvs/lib:$LD_LIBRARY_PATH
# export CPLUS_INCLUDE_PATH=/usr/local/kvs/include:$CPLUS_INCLUDE_PATH

# settings for Qt5
# export QTDIR=~/Qt/5.1.1/clang_64
# export PATH=$QTDIR/bin:$PATH
# export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH
# export CPLUS_INCLUDE_PATH=$QTDIR/include:$CPLUS_INCLUDE_PATH
# export PATH=/usr/local/opt/qt5/bin:$PATH
# export LD_LIBRARY_PATH=/usr/local/opt/qt5/lib:$LD_LIBRARY_PATH
# export CPLUS_INCLUDE_PATH=/usr/local/opt/qt5/include:$CPLUS_INCLUDE_PATH

# settings for Qt4
function qxmake() {
qmake -project;
qmake -spec macx-xcode;
}
alias qxmake=qxmake

# settings for EMSCRIPTEN
EMSCRIPTEN_PATH=$HOME/emscripten
export PATH=$EMSCRIPTEN_PATH:$PATH
