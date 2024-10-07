return {
	"folke/noice.nvim",
	event = verylazy,
	dependencies = {
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				-- overide markdown rendering so that **cmp** and other plugins use **treesitter**
				lsp = {
					overide = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},

				-- you can enable a presset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_pallete = true, -- positon the cmdline and popupmenu together
					long_message_to_split = true, -- long message will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signatures help
				},
			},
		})
	end,
}
