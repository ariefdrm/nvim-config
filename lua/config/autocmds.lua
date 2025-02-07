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

-- auto reload init.lua
vim.api.nvim_create_autocmd("BufWritePost", {
	group = autocmd_group,
	pattern = { "~/.config/nvim/init.lua", "~/.config/nvim/lua/**/*.lua" },
	command = "source <afile> | PackerCompile",
	desc = "Reload nvim config",
})

-- auto equalize window sizes
vim.api.nvim_create_autocmd("VimResized", {
	group = autocmd_group,
	pattern = "*",
	command = "tabdo wincmd =",
	desc = "Equalize window sizes",
})
