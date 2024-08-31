return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("bufferline").setup({})
		-- Mapping for bufferline
		vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>") -- move next buffer
		vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>") -- move prev buffer
		vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>") -- Close current buffer
	end,
}
