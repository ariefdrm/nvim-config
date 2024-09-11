return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "c", "cpp", "c_sharp", "html", "css", "javascript" },
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
