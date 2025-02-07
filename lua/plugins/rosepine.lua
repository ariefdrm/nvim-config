return {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	enabled = false,
	config = function()
		require("rose-pine").setup({
			variant = "moon",
		})
		vim.cmd([[colorscheme rose-pine]])
	end,
}
