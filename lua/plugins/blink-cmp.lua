return { -- add blink.compat
	{
		"saghen/blink.compat",
		-- use the latest release, via version = '*', if you also use the latest release for blink.cmp
		version = "*",
		-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
		lazy = true,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {},
	},
	-- Blink cmp
	{
		"Saghen/blink.cmp",
		dependencies = {
			-- { "echasnovski/mini.snippets", version = "*" },
			-- "rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
			"fang2hou/blink-copilot",
			"Exafunction/windsurf.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
		},
		Event = "InsertEnter",
		version = "1.*",

		---@module 'blink.cmp'
		---@diagnostic disable-next-line: undefined-doc-name
		---@type blink.cmp.Config
		opts_extend = {
			"sources.completion.enabled_providers",
			"sources.compat",
			"sources.default",
		},
		opts = {
			-- Use a preset for snippets, check the snippets documentation for more information
			snippets = {
				preset = "luasnip", -- "default" | "luasnip" | "mini_snippets"

				-- Function to use when expanding LSP provided snippets
				expand = function(snippet)
					vim.snippet.expand(snippet)
				end,
				-- Function to use when checking if a snippet is active
				active = function(filter)
					return vim.snippet.active(filter)
				end,
				-- Function to use when jumping between tab stops in a snippet, where direction can be negative or positive
				jump = function(direction)
					vim.snippet.jump(direction)
				end,
			},

			keymap = {
				preset = "none",
				-- ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
				-- ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<C-l>"] = {
					function(cmp)
						cmp.show({ providers = { "lsp", "path", "snippets", "buffer" } })
					end,
				},
				["<CR>"] = { "accept", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
				-- Use the default icon for the first item in the menu
			},

			cmdline = {
				keymap = {
					["<Tab>"] = { "show_and_insert", "select_next" },
					["<S-Tab>"] = { "show_and_insert", "select_prev" },
					["<C-l>"] = { "show" },
					["<C-k>"] = { "select_and_accept" },
					["<CR>"] = { "accept_and_enter", "fallback" }, --{ "accept", "fallback" },
				},
				completion = { menu = { auto_show = true }, ghost_text = { enabled = true } },
			},

			completion = {
				-- Show documentation when selecting a completion item
				documentation = { auto_show = true, auto_show_delay_ms = 500 },

				-- ghost text
				ghost_text = {
					enabled = false,
					show_with_selection = true,
					show_without_selection = false,
					show_with_menu = true,
					show_without_menu = true,
				},

				-- trigger
				--[[ trigger = {
					show_on_insert_on_trigger_character = true,
					show_on_x_blocked_trigger_characters = {
						"'",
						'"',
						"(",
						"{",
						"[",
					},
				}, ]]

				menu = {
					-- auto_show = true,
					draw = {
						components = {
							kind_icon = {
								text = function(ctx)
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = require("lspkind").symbolic(ctx.kind, {
											mode = "symbol",
										})
									end

									return icon .. ctx.icon_gap
								end,

								-- Optionally, use the highlight groups from nvim-web-devicons
								-- You can also add the same function for `kind.highlight` if you want to
								-- keep the highlight groups in sync with the icons.
								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							},
						},
					},
				},
			},

			sources = {
				default = { "snippets", "lsp", "path", "buffer", "codeium", "copilot" },

				per_filetype = {
					sql = { "dadbod" },
					-- optionally inherit from the `default` sources
					lua = { inherit_defaults = true, "lazydev" },
				},

				providers = {
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 99,
						async = true,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
					codeium = { name = "Codeium", module = "codeium.blink", async = true },
				},
			},

			-- Experimental signature help support
			signature = { enabled = true },

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},

	-- {
	-- 	"github/copilot.vim",
	-- 	cmd = "Copilot",
	-- 	event = "BufWinEnter",
	-- 	init = function()
	-- 		vim.g.copilot_no_maps = true
	-- 	end,
	-- 	config = function()
	-- 		-- Block the normal Copilot suggestions
	-- 		vim.api.nvim_create_augroup("github_copilot", { clear = true })
	-- 		vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
	-- 			group = "github_copilot",
	-- 			callback = function(args)
	-- 				vim.fn["copilot#On" .. args.event]()
	-- 			end,
	-- 		})
	-- 		vim.fn["copilot#OnFileType"]()
	-- 	end,
	-- },
}
