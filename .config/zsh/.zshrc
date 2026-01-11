autoload -U colors && colors # enable colors

#: GREETER
PROMPT="%F{black}%K{blue} %n %K{cyan} %2d %f%k %(?..%F{red}%? )%f%k; "
RPROMPT="%F{magenta}%T%f"

#: PLUGINS
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zi snippet OMZL::git.zsh
zi snippet OMZP::sudo
#zi cdclear -q #forget completions
zi ice lucid wait'3'
zi light zdharma-continuum/fast-syntax-highlighting

#: MAIN ZSH
setopt autocd # type a dir to cd
setopt extended_glob # match ~ # ^
setopt noglobdots
setopt longlistjobs # report PID on suspend
setopt noshwordsplit # zsh style word splitting
#setopt nohup # dont kill background processess
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

#: HISTORY
export HISTFILE="$XDG_CACHE_HOME/zsh_history"
setopt append_history 
setopt share_history
setopt histignorespace

#: Completion
setopt hash_list_all # on cmp ensures correction but may be slow
setopt auto_param_slash # slash/ for dirs in cmp menu
setopt auto_menu menu_complete # autocmp first menu match
setopt completeinword
setopt no_case_glob no_case_match # case insensitive cmp

zmodload zsh/complist
autoload -U compinit && compinit

zstyle ':completion:*' menu select=3 # only use menu if more than 3 opts
zstyle ':completion:*' special-dirs .. # .. will show 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # match uppercase from lowercase
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # colorize cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion
##zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}' # format on cmp menu
# complete manual by their section
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select
zstyle ':completion:*'            use-cache yes
zstyle ':completion:*:complete:*' cache-path "$HOME/.cache"
# complete cd -<tab> with menu, dirs integration
zstyle ':completion:*:*cd:*:directory-stack' menu yes select

#: Correction
setopt correct # correction nyae
zstyle ':completion:*:correct:*' max-errors 1 # only correct if 1 typo

#: KEYBINDS
# disable vi-mode (it sucks, open line in vim with ^n)
bindkey -e
# uses EDITOR env var
autoload edit-command-line
zle -N edit-command-line
bindkey '^n' edit-command-line

# plugin wont work without vi-mode, so I turn vi-mode off and paste plugin here
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#: fzf integration
if command -v fd &>/dev/null; then
    export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --max-depth 4"
    export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --max-depth 4"
fi

if command -v fzf &>/dev/null; then
    if [[ -e "$XDG_DATA_HOME/fzf_init.zsh" ]]; then
        source "$XDG_DATA_HOME/fzf_init.zsh" 
        bindkey '^j' fzf-file-widget
        bindkey '^g' fzf-cd-widget
    else
        fzf --zsh >"$XDG_DATA_HOME/fzf_init.zsh"
    fi
fi

#: yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

bindkey -s '^t' "tmux a || tmux new^M"

bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char

[ -f "$XDG_CONFIG_HOME/shell/aliasrc" ] && source $XDG_CONFIG_HOME/shell/aliasrc
[ -f "$XDG_CONFIG_HOME/zsh/dirs.zsh" ] && source $XDG_CONFIG_HOME/zsh/dirs.zsh
