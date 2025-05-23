return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("bufferline").setup({
			options = {
				mods = "tabs",
				separator_style = "slant",
				numbers = "buffer_id",
			},
		})
	end,
}
