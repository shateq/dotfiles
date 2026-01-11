# conf.d is read first
if status is-interactive
    set -g fish_greeting

    set -gx PATH $PATH ~/.local/bin

    if command -q fd
        set -gx FZF_CTRL_T_COMMAND 'fd --type f --hidden --follow --no-ignore-vcs --max-depth 4'
        set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --no-ignore-vcs --max-depth 3'
    end

    # Initialize fuzzy finder
    if type -q fzf
        if not test -r $__fish_cache_dir/fzf_init.fish
            fzf --fish >$__fish_cache_dir/fzf_init.fish
        end
		source $__fish_cache_dir/fzf_init.fish
    end
end
