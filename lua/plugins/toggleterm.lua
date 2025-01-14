return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			auto_scroll = true,

			-- Use PowerShell as the shell on Windows, un-comment this syntax bellow
			-- shell = vim.fn.has("win32") == 1 and "pwsh" or vim.o.shell,

			-- whenever i open/re-open auto toggleterm in terminal/insert mode
			on_open = function()
				vim.cmd("startinsert!")
			end,
		})

		-- Keybindings for better terminal usage
		local opts = { noremap = true, silent = true }
		-- vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)
		vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm <CR>", opts)

		-- Keybinding to close terminal with Esc
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n><cmd>ToggleTerm<CR>", opts)
	end,
}
