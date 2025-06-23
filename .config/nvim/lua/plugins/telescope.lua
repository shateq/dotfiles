return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
		{ "<C-f>",      "<cmd>Telescope find_files<CR>", desc = "List current working directory" },
	    { "<C-p>",      "<cmd>Telescope git_files<CR>",  desc = "List git repo files" },
	    { "<leader>fr", "<cmd>Telescope registers<CR>",  desc = "Pull registers" },
	    { "<leader>f?", "<cmd>Telescope keymaps<CR>",    desc = "List keymaps" },
	    { "<leader>fh", "<cmd>Telescope help_tags<CR>",  desc = "Browse help pages" },
		{ "<leader>fws", (function() 
		    local word = vim.fn.expand "<cword>"
		    require("telescope.builtin").grep_string { search = word }
		  end),
		  desc = "Lookup current word-string in cwd",
		},
		{ "<leader>fWs", (function() 
		    local word = vim.fn.expand "<cWORD>"
		    require("telescope.builtin").grep_string { search = word }
		  end),
		  desc = "Lookup current word-string in cwd",
		},
  },
}
