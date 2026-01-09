#!/bin/zsh

fzf-dirs() {
  [[ -z "$BUFFER" ]] && zle accept-line && cd "$(fd . ~ -i -t d -d 3 | fzf --style minimal)"
}

zle -N fzf-dirs
#key string, variable string wont register for some reason
bindkey "^g" fzf-dirs
