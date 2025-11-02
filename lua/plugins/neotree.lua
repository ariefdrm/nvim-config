return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		enabled = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			window = {
				position = "left",
			},
			-- fill any relevant options here
			event_handlers = {
				-- Auto close on open file
				{
					event = "file_open_requested",
					handler = function()
						-- auto close
						vim.cmd("Neotree close")
						-- OR
						-- require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
			filesystem = {
				filtered_items = {
					visible = true, -- Set to true to show filtered items (including hidden files)
					hide_dotfiles = false, -- Explicitly set to false to always show dotfiles
					hide_gitignored = true, -- You can choose whether to hide gitignored files or not
				},
			},
		},
	},

	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				filter_rules = {
					include_current_win = false,
					autoselect_one = true,
					-- filter using buffer options
					bo = {
						-- if the file type is one of following, the window will be ignored
						filetype = { "neo-tree", "neo-tree-popup", "notify" },
						-- if the buffer type is one of following, the window will be ignored
						buftype = { "terminal", "quickfix" },
					},
				},
			})
		end,
	},
}
