# Funky zsh extensions, not polluting the zshrc but too small to download with some plugin manager

# fzf integration 
source <(fzf --zsh)
bindkey '^R' fzf-history-widget

# tui file manager
openn3() {
    nnn <$TTY
    zle redisplay
}
zle -N openn3
bindkey '^F' openn3

# sends fg if not in app
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
