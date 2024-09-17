return {
	"craftzdog/solarized-osaka.nvim",
	lazy = lazy,
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({})
		vim.cmd([[colorscheme solarized-osaka]])
	end,
}
