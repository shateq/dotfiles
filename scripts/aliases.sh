#!/usr/bin/env bash 

# quick
alias \
	0="clear" \
	v="nvim" \
	p="cd ~/Projects" \
    dotf="cd ~/dotfiles" \
	mkd="mkdir -pv"

# config
alias \
	zshrc="nvim ~/.zshrc" \
	zshenv="nvim ~/.zshenv" \
	woman=man # Woman pages! finally

alias ls='eza --color=always --icons=auto --no-user'
alias fastfe='fastfetch --config ~/dotfiles/ref/fastfetch.json'
