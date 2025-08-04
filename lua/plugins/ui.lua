return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.startify")

			dashboard.section.header.val = {
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
						inc_rename = false, -- enables an input dialog for inc-rename.nvim
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
					separator_style = "slant",
					numbers = "buffer_id",
				},
			})
		end,
	},
}
