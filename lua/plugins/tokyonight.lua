return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 0,
	opts = {},
	config = function()
		require("tokyonight").setup({})

		-- set the colorscheme
		vim.cmd([[colorscheme tokyonight]])
	end,
}
