#! /usr/bin/env bash

sxhkd &

picom -b &

~/.fehbg &

#mpd &

dwmblocks 2>/tmp/dwmblocks.log &

setxkbmap pl &
