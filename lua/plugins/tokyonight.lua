return {
	"folke/tokyonight.nvim",
	lazy = false,
	-- priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			style = "moon",
			transparent = false,
		})

		-- set the colorscheme
		-- vim.cmd([[colorscheme tokyonight]])
	end,
}
