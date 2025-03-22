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
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
# bootstrap .zshrc to ~/.config/zsh/.zshrc
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export PATH="$HOME/.local/bin:$HOME/dotfiles/scripts:$PATH"

# flutter use  
export CHROME_BROWSER=chromium-browser
# git
export GCM_CREDENTIAL_STORE=cache

# moving other files and some other vars
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export _JAVA_AWT_WM_NONREPARENTING=1
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
# haskell
export STACK_XDG=1

export LESSHISTFILE="$XDG_CACHE_HOME/less_history"
export PYTHON_HISTORY="$XDG_DATA_HOME/python/history"
export FFMPEG_DATADIR="$XDG_CONFIG_HOME/ffmpeg"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
# nvidia cache
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"
#export DATE=$(date "+%A, %B %e  %_I:%M%P")

export FZF_DEFAULT_OPTS="--style minimal --color 16 --layout=reverse --height 30% --preview='bat -p --color=always {}'"
export FZF_CTRL_R_OPTS="--style minimal --color 16 --info inline --no-sort --no-preview" # separate opts for history widget
#export MANPAGER="less -R --use-color -Dd+r -Du+b" # colored man pages

. "$HOME/.deno/env"
. "$CARGO_HOME/env"
