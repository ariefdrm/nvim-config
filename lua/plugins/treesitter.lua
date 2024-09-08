return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			sync_install = false,
			-- highlighting
			highlight = {
				enable = true,
			},
			-- Indent
			indent = { enable = true },
		})
	end,
}
