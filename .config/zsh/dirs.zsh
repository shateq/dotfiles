#!/bin/zsh

setopt auto_pushd
setopt pushd_ignore_dups

d=~/Documents
h=~/Desktop
p=~/Projects
dots=~/.dotfiles
pics=~/Pictures
notes=~/Documents/Notes/WAT
: ~d ~h ~p ~dots ~pics ~notes

alias d="dirs -v" 

for n in {1..9}; do 
    alias $n="cd +$n";
done
