# ~/dotfiles

My configuration backup to be used with **GNU stow**. Man, I love symlinks so much. 
I'd rather stick to defaults than to invent a new wheel so there won't be no revolutionary
keybinds in here. Just something that builds on top of the original things.

Tools covered:

- zsh  
- alacritty
- kitty
- nvim
- i3
- rofi
- sxhkd
- tmux
- newsboat

## Other folders

- `.local/bin` - contains scripts adjusting my workflow

- `.local/share` - has got desktop-specific and app-specific config reference

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

