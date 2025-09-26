return {
	-- neo-scroll
	{
		"karb94/neoscroll.nvim",
		opts = {},
		config = function()
			require("neoscroll").setup({
				mappings = { -- Keys to be mapped to their corresponding default scrolling animation
					"<C-u>",
					"<C-d>",
					"<C-b>",
					"<C-f>",
					"zt",
					"zz",
					"zb",
				},
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				duration_multiplier = 1.0, -- Global duration multiplier
				easing = "linear", -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
				performance_mode = false, -- Disable "Performance Mode" on all buffers.
				ignored_events = { -- Events ignored while scrolling
					"WinScrolled",
					"CursorMoved",
				},
			})
		end,
	},
	-- nvim-autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				enable_check_bracket_line = true, --- check bracket in same line
				enable_bracket_in_quote = true, -- enable autopairs in quote
				enable_afterquote = true, -- add bracket pairs after quote
			})
		end,
	},

	-- inc-rename.nvim
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup({})
		end,
	},

	-- formatters
	{
		"stevearc/conform.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					html = { "prettier", "prettierd" },
					css = { "prettier", "prettierd" },
					vue = { "prettier", "prettierd" },
					javascript = { "prettier", "prettierd" },
					javascriptreact = { "prettier", "prettierd" },
					typescript = { "prettier", "prettierd" },
					typescriptreact = { "prettier", "prettierd" },
					scss = { "prettier", "prettierd" },
					jsx = { "prettier", "prettierd" },
					csharp = { "csharpier" },
					cpp = { "clang-format" },
					lua = { "stylua" },
					python = { "black", "isort" },
					dart = { "dart_format" },
					php = { "php-cs-fixer" },
					blade = { "blade-formatter" },
					go = { "gofmt" },
					rust = { "rustfmt" },
				},
				format_after_save = {
					timeout_ms = 1000, -- Set a timeout for formatting
				},
			})

			-- Create a custom keybinding for formatting
			vim.api.nvim_set_keymap(
				"n", -- Normal mode
				"<leader>gf", -- Keybinding (e.g., `<leader>f`)
				":lua require('conform').format({ timeout_ms = 2000 })<CR>",
				{ noremap = true, silent = true, desc = "Format code" }
			)
		end,
	},

	-- LSP diagnostics
	{
		"mfussenegger/nvim-lint",
		dependencies = {
			"folke/trouble.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			events = { "BufWritePost", "BufReadPost", "InsertLeave" },
			use_diagnostic_signs = true,
		},
		config = function()
			local lint = require("lint")
			-- Example configuration: enable eslint_d for JavaScript and TypeScript
			lint.linters_by_ft = {
				javascript = { "eslint" },
				typescript = { "eslint" },
				python = { "pylint" },
			}

			-- Automatically lint on save
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	-- Windsurf
	{
		"Exafunction/windsurf.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},

	-- renamer
	{
		"filipdutescu/renamer.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("renamer").setup({})
		end,
	},

	-- copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},

	-- tmux navigator
	{
		"christoomey/vim-tmux-navigator",
		event = "VimEnter",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			-- "TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			-- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	-- yankbank.nvim
	{
		"ptdewey/yankbank-nvim",
		event = "VeryLazy", -- load after UI is ready, not at startup
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("yankbank").setup({
				max_entries = 20, -- number of yanks to keep in history
				persist = false, -- don't save history between sessions
				ring = true, -- cycle through yanks
				picker = {
					type = "telescope", -- can be "telescope" or "default"
				},
			})

			-- Optional: Keymaps
			local map = vim.keymap.set
			map("n", "<leader>p", "<cmd>YankBankPut<CR>", { desc = "Paste from yank history" })
			map("n", "<leader>P", "<cmd>YankBankPutBefore<CR>", { desc = "Paste before from yank history" })
			map("n", "<leader>y", "<cmd>YankBank<CR>", { desc = "Open yank history" })
		end,
	},
}
