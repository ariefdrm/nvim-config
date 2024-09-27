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
		-- keymapping for neotree
		vim.keymap.set("n", "<C-e>", ":Neotree filesystem reveal left<CR>", { silent = true, noremap = true })
	end,
}
