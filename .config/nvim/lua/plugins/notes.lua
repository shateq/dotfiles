return {
  {
    "serenevoid/kiwi.nvim",
    lazy = true,
    opts = {
      {
        name = "cloud",
        path = "Documents/Nextcloud/Notes",
      },
      {
        name = "local",
        path = vim.fn.expand("$HOME/Documents/Wiki"),
      },
    },
    keys = {
      { "<leader>ww", ':lua require("kiwi").open_wiki_index()<cr>', desc = "Open Wiki index" },
      { "<leader>wl", ':lua require("kiwi").open_wiki_index("local")<cr>', desc = "Open Wiki index" },
      { "<leader>T", ':lua require("kiwi").todo.toggle()<cr>', desc = "Toggle Markdown Task" },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
	lazy = true,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {},
  },
}
