# HOMEBREW
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# $HOME/local
if [ -d $HOME/local/bin ]; then
    export PATH=$HOME/local/bin:$PATH
fi
# $HOME/.local
if [ -d $HOME/.local/bin ]; then
    export PATH=$HOME/.local/bin:$PATH
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
# CABAL
export PATH="$HOME/Library/Haskell/bin:$PATH"
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
  unset -f nodenv
  unset -f rbenv
  unset -f pyenv 
  unset -f goenv 
}
function nodenv() {
  anyenv_unset
  anyenv_init
  nodenv "$@"
}
function rbenv() {
  anyenv_unset
  anyenv_init
  rbenv "$@"
}
function pyenv() {
  export PYENV_VIRTUALENV_DISABLE_PROMPT=0
  anyenv_unset
  anyenv_init
  pyenv "$@"
}
function goenv() {
  anyenv_unset
  anyenv_init
  goenv "$@"
}
