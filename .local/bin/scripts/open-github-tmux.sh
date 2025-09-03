#!/usr/bin/env bash

cd $(tmux run "echo #{pane_path}")
url=$(git remote get-url origin)

$BROWSER2 $url || echo "No remote found"
