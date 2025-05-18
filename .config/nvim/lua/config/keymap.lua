--[[  KEYMAP  --]]
local function map(m, k, v)
  vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

map("n", "<leader>cc", function()
  --  if not vim.opt.colorcolumn == "" then
  vim.opt.colorcolumn = ""
  --  end
end)

map("n", "<leader>nn", function() --toggle relative vs absolute line numbers
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    vim.wo.number = true
  else
    vim.wo.relativenumber = true
  end
end)

map("n", "<leader><C-t>", ":tabnew<CR>")

map("n", "<leader>pv", "<cmd>Oil<CR>", { desc = "Open parent directory" })
--map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>%", "<cmd>source %<CR>") -- execute current file
map("n", "<leader>s", ":%s//g<Left><Left>") --replace all
map("n", "<leader>d", ":w ") --duplicate to new name
map("n", "<leader>x", "<cmd>!chmod +x %<CR>") --make a file executable

-- CTRL+<hjkl> to focus windows instead of win mode
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")

map("n", "<F5>", ":resize +2<CR>")
map("n", "<F6>", ":resize -2<CR>")
map("n", "<F7>", ":vertical resize +2<CR>")
map("n", "<F8>", ":vertical resize -2<CR>")
