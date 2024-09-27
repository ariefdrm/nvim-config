return {
	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			-- Mapping for gitsigns
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { silent = true })
			vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { silent = true })
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { silent = true })
		end,
	},
	-- Fugitive Vim
	{ "tpope/vim-fugitive" },
}
