return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- treesitter configuration
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "c", "cpp", "c_sharp", "html", "css", "javascript", "python" },
			auto_install = true,
			sync_install = false,
			-- highlighting
			highlight = {
				enable = true,
			},
			-- Indent
			indent = { enable = true },
		})

		-- nvim-ts-autotag configuration
		require("nvim-ts-autotag").setup({
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
			-- Also override individual filetype configs, these take priority.
			-- Empty by default, useful if one of the "opts" global settings
			-- doesn't work well in a specific filetype
			per_filetype = {
				["html"] = {
					enable_close = true,
				},
			},
		})
	end,
}
