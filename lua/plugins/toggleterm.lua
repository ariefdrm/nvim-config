return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({})

		-- Keybindings for better terminal usage
		local opts = { noremap = true, silent = true }
		-- vim.api.nvim_set_keymap("i", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)
		vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)

		-- Keybinding to close terminal with Esc
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n><cmd>ToggleTerm<CR>", opts)
	end,
}
