#!/bin/sh

alias \
yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"' \
conky='conky --config="$XDG_CONFIG_HOME/conky/conkyrc"' \
fastfetch='fastfetch --config="~/dotfiles/ref/fastfetch.json"' \

alias \
\
0="clear" \
v="nvim" \
p="cd ~/Projects" \
dotf="cd ~/dotfiles" \
mkd="mkdir -pv" \
rmd="rm -r" \
sln="ln -s" \
grep="grep --color=auto" \
ls="eza --color=always" \
ll="eza --color=always --icons=always -lh --no-user" \
lh="eza --color=always -lah --no-user" \
df="df -h" \
du="du -h -d 1" \
zshrc="nvim $XDG_CONFIG_HOME/zsh/.zshrc" \
news="newsboat" \
conky-reload="killall -SIGUSR1 conky" \
screen-half="xrandr --output HDMI-0 --brightness 0.5" \
screen-full="xrandr --output HDMI-0 --brightness 1.0" \
