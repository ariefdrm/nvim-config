return {
	-- Blink cmp
	{
		"Saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		Event = "InsertEnter",
		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none",
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" }, -- show with a list of providers
				["<C-l>"] = {
					function(cmp)
						cmp.show({ providers = { "snippets" } })
					end,
				},
				["<CR>"] = { "accept", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = { auto_show = true },
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer", "codeium" },
				providers = {
					codeium = { name = "Codeium", module = "codeium.blink", async = true },
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},

	-- Codeium
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({
				virtual_text = {
					enable = true,
					filetypes = {},
				},
			})
		end,
	},
}
