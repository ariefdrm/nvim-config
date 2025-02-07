return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			event_handlers = {
				-- Auto close on open file
				{
					event = "file_open_requested",
					handler = function()
						-- auto close
						vim.cmd("Neotree close")
						-- OR
						-- require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})
	end,
}
