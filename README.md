# ~/dotfiles

My configuration backup to be used with **GNU stow**. Man, I love symlinks so
much. Let's get to using it.

This repository has also `./scripts/` dir (which isn't copied), containing
mostly utilities. This repository contains also `./ref/` dir which contains
referenced material.

## Using stow

Stow respects provided `.stow-local-ignore` file, as well as
`.stow-global-ignore`, situtated in ~/ and the files (ignored by
default)[https://www.gnu.org/software/stow/manual/stow.html#Ignore-Lists].

```
$ stow .
```

(manual)[https://www.gnu.org/software/stow/manual/stow.html]

## Secrets

Not an option at the moment, I'll see what I can think of to put them here.
