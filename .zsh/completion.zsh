# Homebrew の site-functions を追加
if [ -d /usr/local/share/zsh/site-functions ]; then
    fpath=(/usr/local/share/zsh/site-functions $fpath)
fi
if [ -d /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi