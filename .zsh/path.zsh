# $HOME/local
if [ -d $HOME/local/bin ]; then
    export PATH=$HOME/local/bin:$PATH
fi
# $HOME
if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi
# GOPATH
if [ -d $HOME/go ]; then
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH
fi
#typeset -U path PATH

# ----- ENV TOOLS ----- 
export ANYENV_ROOT="$HOME/.anyenv"
if [ -d $ANYENV_ROOT ]; then
  export PATH="$ANYENV_ROOT/bin:$PATH"
  for D in `command ls $ANYENV_ROOT/envs`
  do
    export PATH="$ANYENV_ROOT/envs/$D/shims:$PATH"
  done
fi
function anyenv_init() {
  eval "$(anyenv init - --no-rehash)"
}
function anyenv_unset() {
  unset -f ndenv
  unset -f rbenv
  unset -f pyenv 
  unset -f goenv 
}
function ndenv() {
  anyenv_unset
  anyenv_init
  ndenv "$@"
}
function rbenv() {
  anyenv_unset
  anyenv_init
  rbenv "$@"
}
function pyenv() {
  anyenv_unset
  anyenv_init
  pyenv "$@"
}
function goenv() {
  anyenv_unset
  anyenv_init
  goenv "$@"
}
