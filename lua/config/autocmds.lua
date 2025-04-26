-- Create an augroup to manage autocmds
local autocmd_group = vim.api.nvim_create_augroup("MyAutoCmds", { clear = true })

-- refresh neovim whenever files change
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	group = autocmd_group,
	pattern = "*",
	callback = function()
		vim.cmd("checktime")
	end,
	desc = "Refresh files when changed outside Neovim",
})

-- auto equalize window sizes
vim.api.nvim_create_autocmd("VimResized", {
	group = autocmd_group,
	pattern = "*",
	command = "tabdo wincmd =",
	desc = "Equalize window sizes",
})

-- Set C# files to use 4-space indentation
vim.api.nvim_create_autocmd("FileType", {
	group = autocmd_group,
	pattern = "cs",
	callback = function()
		vim.bo.tabstop = 4 -- 1 Tab = 4 spaces
		vim.bo.shiftwidth = 4 -- Indent/outdent by 4 spaces
		vim.bo.expandtab = true -- Convert tabs to spaces
	end,
	desc = "Set 4-space indentation for C# files",
})

vim.api.nvim_create_autocmd("ColorScheme", {
	group = autocmd_group,
	pattern = "*",
	callback = function()
		local bufferline = require("bufferline")
		local opts = {
			options = {
				mods = "tabs",
				separator_style = vim.g.colors_name == "solarized-osaka" and "thin" or "slant",
				numbers = "buffer_id",
			},
		}
		bufferline.setup(opts)
	end,
})

-- blade syntax highlighting
vim.api.nvim_create_autocmd("FileType", {
	group = autocmd_group,
	pattern = "blade",
	callback = function()
		vim.bo.filetype = "php" -- Treat Blade files as PHP for syntax highlighting
	end,
})
