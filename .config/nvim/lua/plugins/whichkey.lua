return {
  --enabled = false,
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      colours = false,
      keys = {
        C = "^",
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show { global = false }
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
