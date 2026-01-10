# conf.d is read first
if status is-interactive
    set -gx PATH $PATH ~/.local/bin
    set -g fish_greeting

    if command -q fd
        set -gx FZF_CTRL_T_COMMAND 'fd --type f --hidden --follow --no-ignore-vcs --max-depth 4'
        set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --no-ignore-vcs --max-depth 3'
    end

    # Initialize fuzzy finder
    if type -q fzf
        if not test -r $__fish_cache_dir/fzf_init.fish
            fzf --fish >$__fish_cache_dir/fzf_init.fish
        end
		#source $__fish_cache_dir/fzf_init.fish
    end

    bind ctrl-t "tmux a || tmux new"
    bind ctrl-z 'fg 2>/dev/null; commandline -f repaint'
end
