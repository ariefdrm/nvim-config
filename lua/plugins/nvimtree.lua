return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = true,
	config = function()
		require("nvim-tree").setup({
			sort_by = "name",
			view = {
				adaptive_size = true,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		})
	end,
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
	},
}
