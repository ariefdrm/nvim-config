return {
	-- formatters
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					html = { "prettier", "prettierd" },
					css = { "prettier", "prettierd" },
					javascript = { "prettier", "prettierd" },
					typescript = { "prettier", "prettierd" },
					csharp = { "clang-format" },
					cpp = { "clang-format" },
					lua = { "stylua" },
				},
				format_on_save = {
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
		dependencies = { "folke/trouble.nvim", "nvim-tree/nvim-web-devicons" },
		opts = {
			use_diagnostic_signs = true,
		},
		config = function()
			local lint = require("lint")
			-- Example configuration: enable eslint_d for JavaScript and TypeScript
			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
			}

			-- Automatically lint on save
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
