return {
	-- indent-blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		config = function()
			require("ibl").setup({
				scope = { enabled = false },
			})
		end,
	},
	-- mini.indentscope
	{
		"echasnovski/mini.indentscope",
		version = false,
		dependencies = {
			-- "echasnovski/mini.nvim",
		},
		config = function()
			require("mini.indentscope").setup({
				symbol = "│",
				options = { try_as_border = true },
				vim.api.nvim_create_autocmd("filetype", {
					pattern = {
						"alpha",
						"dashboard",
						"noice",
						"fzf",
						"help",
						"lazy",
						"lazyterm",
						"mason",
						"neo-tree",
						"notify",
						"toggleterm",
						"Trouble",
						"trouble",
						"dbee",
						"dbui",
						"nvimtree",
					},
					callback = function()
						vim.b.miniindentscope_disable = true
					end,
				}),
			})
		end,
	},
}
