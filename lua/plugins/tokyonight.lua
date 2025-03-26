return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	-- enabled = false,
	opts = {},
	config = function()
		require("tokyonight").setup({
			style = "moon",
			transparent = false,
		})
	end,
}
