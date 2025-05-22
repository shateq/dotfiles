return {
  "stevearc/oil.nvim",
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
	view_options = {
	  show_hidden = true,
	},
  },
}
