#!/bin/zsh

fzf-dirs() {
  [[ -z "$BUFFER" ]] && zle accept-line && cd "$(tree -dfiL 3 $HOME | fzf --style minimal)"
  [[ -n "$BUFFER" ]] && BUFFER+=";"
}

zle -N fzf-dirs
#key string, variable string wont register for some reason
bindkey ";" fzf-dirs
