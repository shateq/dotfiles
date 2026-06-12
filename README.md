# ~/.dotfiles

daily driving hyprland currently with dwm-like waybar
!! my bulletproof arch linux with btrfs snapshots via snapper, 
nix for portable dev environments, linux lts kernel, 
flatpak for sandboxing (like steam, it also makes $HOME cleaner)
read-only /boot partition

## Structure
.
├── .config/   - plain config files
├── .local/    
│   ├── bin/   - utility scripts
│   └── share/ - other meta files
└── systemd/   - systemd .service files

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

### OLD dwm setup

- `sxhkd` for universal keyboard Media buttons
- uses `dwmblocks-async` for the statusbar
- patches can be found in [my dwm repo](https://github.com/shateq/dwm)
- `rofi` app launcher and `dmenu` for script input
- `zathura`, `mpv` and `nsxiv` for any kind of media

- NO SCREENSHOT SOLUTION right now
- no `Xresources` support 
- I've never used no scratchpad
