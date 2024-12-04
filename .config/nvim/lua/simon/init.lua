--[[
--      EDITOR SETTINGS
--]]
print("Editor settings and leader loaded up")

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- netrw customization
vim.g.netrw_banner = 0

-- :help mapleader
vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '

-- :help vim.opt
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.cursorline = true -- very COOL
vim.opt.guicursor = ""
vim.opt.termguicolors = true
--vim.opt.showmode = false -- uncomment if there is a statusbar

vim.opt.wrap = true -- def to true, text wrapping if goes out of focus
--vim.opt.mouse = 'a'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.breakindent = true -- enable break indent
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 5 -- this is VERY cool
--vim.opt.signcolumn = "yes"
--vim.opt.isfname:append("@-@")

-- Undo file
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 200 -- swap file related
--vim.opt.colorcolumn = "80" -- characters before the column
