#!/bin/zsh

fzf-dirs() {
  [[ -z "$BUFFER" ]] && zle accept-line && cd "$(tree -dfiL 3 $HOME | fzf)"
}

zle -N fzf-dirs
#key string, variable string wont register for some reason
bindkey "^g" fzf-dirs
