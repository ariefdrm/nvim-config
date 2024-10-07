return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},

	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- Close Neo-tree when it is the last window open
			filesystem = {
				hijack_netrw_behavior = "open_default", -- Recommended for file management
			},
		})
		-- keymapping for neotree
		vim.keymap.set("n", "<C-e>", ":Neotree filesystem reveal left<CR>", { silent = true, noremap = true })
	end,
}
