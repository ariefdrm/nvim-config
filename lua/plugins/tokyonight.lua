return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 0,
	opts = {},
	config = function()
		-- set the colorscheme
		vim.cmd([[colorscheme tokyonight]])
	end,
}
