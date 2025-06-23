return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    always_show_tabline = false,
    sections = {
      --lualine_x = {"filetype","encoding"},
      lualine_x = { "searchcount" },
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {
      lualine_b = {
        {
          "tabs",
          mode = 1,
          max_length = vim.o.columns * 0.6,
          section_separators = { left = "", right = "" },
          cond = function()
            return vim.fn.tabpagenr "$" > 1
          end,
        },
      },
      lualine_y = { "filetype", "encoding" },
    },
  },
}
