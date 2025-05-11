return {
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		-- enabled = false,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
			})
		end,
	},

	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({})
		end,
	},
}
