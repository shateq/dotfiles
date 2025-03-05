#!/bin/sh
# vars set on login ~/.config/zsh/.zshrc

# default programs
export EDITOR="nvim"
export TERM="alacritty"
export TERMINAL="alacritty"
#export MUSPLAYER="termusic"
export BROWSER="librewolf"
export BROWSER2="chromium-browser"
# export DISPLAY=:0 # useful for some scripts

# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# bootstrap .zshrc to ~/.config/zsh/.zshrc
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# add scripts to path
export PATH="$XDG_CONFIG_HOME/.local/bin:$HOME/dotfiles/scripts:$PATH"

# history files
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"
export PYTHON_HISTORY="$XDG_DATA_HOME/python/history"

# other programs
export CHROME_BROWSER=chromium-browser #flutter use
export GCM_CREDENTIAL_STORE=cache

. "$HOME/.cargo/env"
. "$HOME/.deno/env"

# moving other files and some other vars
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export _JAVA_AWT_WM_NONREPARENTING=1
export FFMPEG_DATADIR="$XDG_CONFIG_HOME/ffmpeg"
#export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
#export DATE=$(date "+%A, %B %e  %_I:%M%P")

export FZF_DEFAULT_OPTS="--style minimal --color 16 --layout=reverse --height 30% --preview='bat -p --color=always {}'"
export FZF_CTRL_R_OPTS="--style minimal --color 16 --info inline --no-sort --no-preview" # separate opts for history widget
#export MANPAGER="less -R --use-color -Dd+r -Du+b" # colored man pages
