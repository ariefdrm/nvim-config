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
	-- Lazygit
	{
		"kdheepak/lazygit.nvim",
		lazy = false,
		cmd = {

			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
