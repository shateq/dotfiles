#: KEYBINDS
# disable vi-mode (it sucks, open line in vim with A-n)
bindkey -e

autoload edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line

bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char

# plugin wont work without vi-mode, so I turn vi-mode off and paste plugin here
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#: fzf integration
if command -v fd &>/dev/null; then
    export FZF_CTRL_T_COMMAND="fd --type f --follow --max-depth 3"
    export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --max-depth 3"
fi

if command -v fzf &>/dev/null; then
    if [[ -e "$XDG_DATA_HOME/fzf_init.zsh" ]]; then
        source "$XDG_DATA_HOME/fzf_init.zsh" 
        bindkey '^j' fzf-file-widget
        # alt+c for cd widget
        # ctrl+r for history widget
    else
        fzf --zsh >"$XDG_DATA_HOME/fzf_init.zsh"
    fi
fi

#: yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -n "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

#: tmux
bindkey -s '^t' "tmux a || tmux new^M"
