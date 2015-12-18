#~/.zsh/lprompt.zsh

# user@host
local p_uh="%(?.%F{green}.%F{magenta})%n@%m%f${WINDOW+[$WINDOW]}"
# current dir
local p_cd="%F{cyan}%~%f"
# prefix
local p_pr="%(!,#,$)"
# prompt
prompt="[$p_uh $p_cd]
$p_pr "

