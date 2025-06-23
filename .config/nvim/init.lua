--  [[ my minimal config --]]
vim.g.mapleader = ","
--vim.g.maplocalleader = ","

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup {
  spec = "plugins",
  install = { colorscheme = { "catppuccin-mocha" } },
  checker = { enabled = false },
  change_detection = { notify = false },
}

require "config"
require "config.keymap"
require "config.autocmd"
