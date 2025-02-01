return {
	-- Autocompletion plugin
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
			"hrsh7th/cmp-path", -- Path source for nvim-cmp
			"hrsh7th/cmp-cmdline", -- Command-line source for nvim-cmp
			"saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
			"L3MON4D3/LuaSnip", -- Snippet engine
			"rafamadriz/friendly-snippets", -- Snippet collection
			"onsails/lspkind.nvim", -- lspkind
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			-- Set highlight groups for the completion menu
			vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#D8DEE9" }) -- Default text
			vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#808080", strikethrough = true }) -- Deprecated items
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#81A1C1" }) -- Matched text
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#81A1C1" }) -- Fuzzy-matched text
			vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#88C0D0" }) -- Kind (e.g., Class, Function)
			vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#5E81AC" }) -- Source (e.g., LSP, Buffer)

			-- vscode format
			require("luasnip.loaders.from_vscode").lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
			require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

			cmp.setup({
				experimental = {
					ghost_text = { hlgroup = "Comment" },
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text", -- Show both icons and text
						maxwidth = 50, -- Max width of the completion menu
						ellipsis_char = "...", -- Ellipsis when text overflows
						menu = {
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[Snip]",
							nvim_lua = "[Lua]",
							path = "[Path]",
						},
					}),
				},
				window = {
					documentation = {
						border = "rounded", -- Border style: 'single', 'double', 'rounded', 'shadow', or custom
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
					completion = {
						border = "rounded",
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-l>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- using tab for next completion and previous completion
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources({
					{ name = "codeium" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "path" },
					{ name = "buffer" },
				}),
			})

			-- Setup for command-line completion
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},

	-- Codeium
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},
}
