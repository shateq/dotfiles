local opt = vim.opt

--[[  OPTION  --]]
opt.clipboard = 'unnamedplus' --system clipboard
opt.history = 100

-- Search
opt.inccommand = "split"
opt.ignorecase = true
opt.smartcase = true

opt.nu = true
opt.relativenumber = true
opt.numberwidth = 3
opt.ruler = false

opt.wrap = true --text wrapping if goes out of focus
opt.linebreak = true

opt.splitbelow = true
opt.splitright = true

opt.cursorline = true --highlight line
opt.showmode = false --uncomment if there is a statusbar
opt.showcmd = false

opt.guicursor = ""
opt.termguicolors = true
opt.scrolloff = 4 -- this is VERY cool

opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.smartindent = true

-- Undo file
opt.undofile = true
opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/vim/undodir"
opt.backup = false
opt.swapfile = false
opt.updatetime = 200 -- swap file related

-- netrw customization
vim.g.netrw_banner = 0
