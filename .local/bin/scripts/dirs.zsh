#!/bin/zsh

setopt auto_pushd
setopt pushd_ignore_dups

p=~/Projects
dots=~/dotfiles
docs=~/Documents
pics=~/Pictures
: ~p ~dots ~docs ~pics

alias d="dirs -v" 

for n in {1..9}; do 
    alias $n="cd +$n";
done
