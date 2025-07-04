#!/bin/sh

#: this file runs on login, it's for env variables only
export PATH="$PATH:$(find -L ~/.local/bin -type d | paste -sd ':' -):$XDG_DATA_HOME/JetBrains/Toolbox/scripts"

#: default programs
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="librewolf"
export BROWSER3="brave-browser"
#export DISPLAY=:0 # useful for some scripts

#: xdg spec
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export MPDCONF="$XDG_CONFIG_HOME/mpd/mpd.conf"
#: programs
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export FFMPEG_DATADIR="$XDG_CONFIG_HOME/ffmpeg"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
#: git
export GCM_CREDENTIAL_STORE=gpg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
#: android development
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CHROME_BROWSER=$BROWSER2
#: xserver
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
export USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
#: haskell
export STACK_XDG=1
#: docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"
#: rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
#: go
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
#: java
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export _JAVA_AWT_WM_NONREPARENTING=1
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export HISTFILE="$XDG_CACHE_HOME/bash_history"
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"
export PYTHON_HISTORY="$XDG_DATA_HOME/python/history"
#: nvidia cache
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"

. "$HOME/.deno/env"
. "$CARGO_HOME/env"
