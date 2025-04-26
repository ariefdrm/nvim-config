return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPre",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- treesitter configuration
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "html", "css", "javascript" },
			auto_install = true,
			sync_install = false,
			-- highlighting
			highlight = {
				enable = true,
			},
			-- Indent
			indent = { enable = true },
		})

		-- for clode blade
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		---@diagnostic disable-next-line: inject-field
		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}

		vim.filetype.add({ extension = { ejs = "ejs" } })
		vim.treesitter.language.register("html", "ejs")
		vim.treesitter.language.register("javascript", "ejs")
		vim.treesitter.language.register("embedded_template", "ejs")

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
