# ショートカット
alias o=open

# PROMPT
case "$TERM" in
    xterm*|kterm*|rxvt*)
    #PROMPT=$(print "%(5~,%-2~/.../%2~,%~)%{\e[33m%}%# %b")
    #PROMPT=$(print "%{\e]2;%n@%m: %~\7%}$PROMPT") # title bar
    local currentDir="%B%F{yellow}[%~]%f%b"
    local userInfo="%B%n%b"
    PROMPT="$currentDir%F{yellow}%#%f "
    ;;
    *)
    #local currentDir = "%B%F{orange}[%~]%f%b"$'\n'
    #local userInfo = "%n@%m"
    PROMPT="$currentDir$userInfo> "
    ;;
esac

# 色を使用できるようにする
autoload -Uz colors
colors

## 補完時に大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1
autoload -U compinit && compinit

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

#########################################
# OS別の設定
case ${OSTYPE} in
	darwin*)
		export CLICOLOR=1
		alias ls='ls -G -F'
		;;
	linux*)
		;;
esac


##########################################
# PATHの設定
if [ -f ~/.bashrc.path ]; then
	source ~/.bashrc.path
fi
