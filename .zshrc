# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/dotfiles/zshcustom"

# $ZSH/themes or $ZSH_CUSTOM/themes
ZSH_THEME="exemplary"

# $ZSH/plugins or $ZSH_CUSTOM/plugins
plugins=(git fancy-ctrl-z sudo docker)

# plugin framework
source $ZSH/oh-my-zsh.sh

zstyle ':omz:update' mode disabled  # disable automatic updates

# use case-sensitive completion.
# CASE_SENSITIVE="true"
# use hyphen-insensitive completion. interchangeable _ and -. Case-sensitive must be off
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. making repository status check for large repositories much faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

# You can set one of the optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format 'man strftime'
HIST_STAMPS="dd.mm.yyyy"
export HISTSIZE=800
export SAVEHIST=800

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# fzf integration (keybindings and completion)
source <(fzf --zsh)

# ALIASES
source ~/dotfiles/scripts/aliases.sh
source ~/dotfiles/scripts/dmenu-places

# pywal
(cat ~/.cache/wal/sequences &)
