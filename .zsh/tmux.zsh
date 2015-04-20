# ----- tmux -----
autoload -Uz add-zsh-hook
function rename_tmux_window() {
   if [ $TERM = "screen" ]; then
       local current_path=`pwd`
       local current_dir=`basename $current_path`
       tmux rename-window $current_dir
   fi
}
add-zsh-hook precmd rename_tmux_window
