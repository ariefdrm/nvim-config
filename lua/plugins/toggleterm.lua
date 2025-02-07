return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			auto_scroll = true,

			-- Use PowerShell as the shell on Windows, un-comment this syntax bellow
			shell = vim.fn.has("win32") == 1 and "pwsh" or vim.o.shell,

			-- whenever i open/re-open auto toggleterm in terminal/insert mode
			on_open = function()
				vim.cmd("startinsert!")
			end,

			size = 15,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			insert_mappings = true,
			persist_size = true,
			close_on_exit = true,
			float_opts = {
				border = "curved",
			},
		})
	end,
}
