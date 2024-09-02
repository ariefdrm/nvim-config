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
			"echasnovski/mini.nvim",
		},
		config = function()
			require("mini.indentscope").setup({
				symbol = "│",
				options = { try_as_border = true },
			})
		end,
	},
}
