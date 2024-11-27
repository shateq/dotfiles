# PATH
PATH="$HOME/bin:$HOME/.local/bin:$HOME/dotfiles/scripts:$PATH"

export GRADLE_HOME=$HOME/opt/GRADLE/gradle-8.10.2/bin
PATH="$PATH:$GRADLE_HOME"

FLUTTER_BIN=$HOME/opt/flutter/bin
PATH="$PATH:$FLUTTER_BIN"

IDEA_BIN=$HOME/opt/IDEA/idea-IC-2024.2.3/bin
PATH="$PATH:$IDEA_BIN"

export PATH

export LANG=en_US.UTF-8

export GCM_CREDENTIAL_STORE=cache

. "$HOME/.cargo/env"

