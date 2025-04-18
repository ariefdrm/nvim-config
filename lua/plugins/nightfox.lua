return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	-- enabled = false,
	config = function()
		require("nightfox").setup({
			options = {
				dim_inactive = true,
			},
		})
	end,
} -- lazy
