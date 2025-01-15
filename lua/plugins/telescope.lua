return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		}, -- telescope dependency
		config = function()
			-- load telescope config
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					-- your existing config
				},
				pickers = {
					live_grep = {
						theme = "dropdown",
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter

						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},

					file_browser = {
						theme = "ivy",
						-- disable netrw and use telescope-file-browser in the place

						hijack_netrw = true,
						mappings = {
							["i"] = {
								-- add custom mappings in insert mode
							},
							["n"] = {
								-- add custom mappings in normal mode
							},
						},
					},
				},
				require("telescope").load_extension("file_browser"),
				require("telescope").load_extension("fzf"),
			})

			-- Set leader key to space
			-- vim.g.mapleader = " "
			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
			vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
			vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>", opts)
		end,
	},

	-- telescope-ui-select-nvim
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- This is your opts table
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
