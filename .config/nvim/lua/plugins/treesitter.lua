return {
  "nvim-treesitter/nvim-treesitter",
  --lazy = true,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "bash",
        "c",
        "lua",
        "java",
        "javascript",
        "typescript",
        "json",
        "rust",
        "haskell",
        "markdown",
        "python",
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = true,
      },
      highlight = {
        enable = true, -- 'false' disables extension
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}
