# ~/dotfiles

My configuration backup to be used with **GNU stow**. Man, I love symlinks so
much.

Tools covered:

- zsh  
- alacritty
- nvim
- i3
- rofi
- sxhkd
- tmux
- newsboat

### folders ignored by stow

- `./scripts/` dir (which isn't copied), with my scripts.

- `./ref/` dir which contains referenced material.

### Using stow

Stow respects provided `.stow-local-ignore` file, as well as
`.stow-global-ignore` (should be in ~/) plus the files [ignored by
default](https://www.gnu.org/software/stow/manual/stow.html#Ignore-Lists).
Sometimes the `--adopt` flag is required, you can choose what to do with
conflicting files.

```sh
$ stow .
```

[manual](https://www.gnu.org/software/stow/manual/stow.html)

## don't commit your secrets

