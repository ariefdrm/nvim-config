return {
	{
		"goolord/alpha-nvim",
		enabled = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.startify")

			local heading1 = {
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
			}

			dashboard.section.header.val = heading1

			alpha.setup(dashboard.opts)
		end,
	},

	-- Noice
	{
		"folke/noice.nvim",
		event = verylazy,
		enabled = true,
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
						inc_rename = true, -- enables an input dialog for inc-rename.nvim
						lsp_doc_border = false, -- add a border to hover docs and signatures help
					},
				},
			})
		end,
	},

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		lazy = false, -- Load the plugin immediately
		enabled = true,
		config = function()
			-- Load the Lualine config
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					disabled_filetypes = {},
					always_divide_middle = true,
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = { "fugitive", "quickfix" },
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- indent-blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		config = function()
			require("ibl").setup({
				scope = { enabled = false },
			})
		end,
	},

	-- mini.indentscope
	{
		"echasnovski/mini.indentscope",
		version = false,
		dependencies = {
			-- "echasnovski/mini.nvim",
		},
		config = function()
			require("mini.indentscope").setup({
				symbol = "│",
				options = { try_as_border = true },
				vim.api.nvim_create_autocmd("filetype", {
					pattern = {
						"alpha",
						"dashboard",
						"noice",
						"fzf",
						"help",
						"lazy",
						"lazyterm",
						"mason",
						"neo-tree",
						"notify",
						"toggleterm",
						"Trouble",
						"trouble",
						"dbee",
						"dbui",
						"nvimtree",
						"snacks_dashboard",
						"snacks_notif",
						"snacks_terminal",
						"snacks_win",
					},
					callback = function()
						vim.b.miniindentscope_disable = true
					end,
				}),
			})
		end,
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("bufferline").setup({
				options = {
					mods = "tabs",
					separator_style = "thin", -- slant | slope | thin
					numbers = "buffer_id",
				},
			})
		end,
	},

	{
		"vyfor/cord.nvim",
		build = ":Cord update",
		opts = {
			-- your config goes here
			text = {
				title = "Cord",
				subtitle = "Neovim config",
			},
		},
	},

	-- transparent
	{
		"xiyaowong/transparent.nvim",
		enabled = false,
		config = function()
			local transparent = require("transparent")

			transparent.setup({
				-- table: default groups
				groups = {
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLine",
					"CursorLineNr",
					"StatusLine",
					"StatusLineNC",
					"EndOfBuffer",
				},
				-- table: additional groups that should be cleared
				extra_groups = {},
				-- table: groups you don't want to clear
				exclude_groups = {},
				-- function: code to be executed after highlight groups are cleared
				-- Also the user event "TransparentClear" will be triggered
				on_clear = function() end,
			})

			transparent.clear_prefix("BufferLine")
			transparent.clear_prefix("Neotree")
			transparent.clear_prefix("NvimTree")
			transparent.clear_prefix("telescope")
		end,
	},
}
