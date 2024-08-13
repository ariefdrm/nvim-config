return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({})

		-- Keybindings for better terminal usage
		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)

        -- Keybinding to close terminal with Esc
		vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n><cmd>ToggleTerm<CR>", opts)
	end,
}
