return {
	"folke/tokyonight.nvim",
	lazy = true,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({})

		-- set the colorscheme
		vim.cmd([[colorscheme tokyonight]])
	end,
}
