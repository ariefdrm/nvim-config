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
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			filters = {
				dotfiles = true,
			},
		})
	end,

	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
	},
}
