# ~/dotfiles

My configuration backup to be used with **GNU stow**. Man, I love symlinks so much. 
I'd rather stick to defaults than to invent a new wheel.

## Other folders

- `.local/bin` - contains scripts for my workflow

- `.local/share` - has got desktop-specific and app-specific config reference

## My dwm setup

- `sxhkd` for universal keyboard Media buttons
- uses `dwmblocks-async` for the statusbar
- patches can be found in [my dwm repo](https://github.com/shateq/dwm)
- `rofi` app launcher and `dmenu` for script input
- `zathura`, `mpv` and `nsxiv` for any kind of media

- NO SCREENSHOT SOLUTION right now
- no `Xresources` support 
- I've never used no scratchpad

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
