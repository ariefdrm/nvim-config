return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("bufferline").setup({
			options = {
				separator_style = "slant",
				numbers = "buffer_id",
			},
		})
		-- Mapping/Keybindings for bufferline
		vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>") -- Move next buffer
		vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>") -- Move prev buffer
		vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>") -- Close current buffer
		vim.keymap.set("n", "<leader>cb", ":bd<CR>", {}) -- Close current buffer
	end,
}
