# .zsh/completion.zsh
# Homebrew の site-functions を追加
if [ -d /usr/local/share/zsh/site-functions ]; then
    fpath=(/usr/local/share/zsh/site-functions $fpath)
fi
if [ -d /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# Smart autocompletion
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'
typeset -U fpath FPATH
