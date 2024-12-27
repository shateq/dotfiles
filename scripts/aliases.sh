#!/usr/bin/env bash 

# quick
alias \
	0="clear" \
	v="nvim" \
	p="cd ~/Projects" \
    dotf="cd ~/dotfiles" \
	mkd="mkdir -pv" \
    rmd="rm -r" \
    ls="eza --color=always" \
    ll="eza --color=always --icons=always -lh --no-user" \
    lh="eza --color=always -lah --no-user" 

# config
alias \
	zshrc="nvim ~/.zshrc" \
	zshenv="nvim ~/.zshenv" \
	woman=man # Woman pages! finally

alias \
    news='newsboat' \
    fastfe='fastfetch --config ~/dotfiles/ref/fastfetch.json' \
    conky-reload='killall -SIGUSR1 conky' 
