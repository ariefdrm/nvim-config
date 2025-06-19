return {
	-- mason nvim
	{
		"mason-org/mason.nvim",
		opts = {
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			}),
		},
	},

	-- mason tools installer
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					-- "prettier",
				},
			})
		end,
	},

	-- Nvim lsp config
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			-- List of LSP servers
			local servers = {
				"lua_ls",
				-- "cssls", -- Css
				-- "emmet_ls", -- emmet_ls
				-- "pyright", -- Python
				-- "clangd", -- C/C++
				-- "dartls", -- Dart
				-- "volar", -- Vue
				-- "ts_ls", -- javascript/typescript
				-- "intelephense", -- PHP
			}

			require("mason-lspconfig").setup({
				automatic_enable = false,
				ensure_installed = servers,
			})

			-- custom config for lua_ls
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						telemetry = { enable = false },
					},
				},
			})

			vim.lsp.config("cssls", {
				filetypes = { "css", "scss", "less", "html" },
			})

			vim.lsp.config("ts_ls", {
				init_options = {
					hostInfo = "neovim",
					preferTsModule = true,
				},
				root_markers = {
					"tsconfig.json",
					"jsconfig.json",
					"package.json",
					".git",
				},
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html" },
			})

			vim.lsp.config("dartls", {
				filetypes = { "dart" },
				init_options = {
					closingLabels = true,
					flutterOutline = true,
					onlyAnalyzeProjectsWithOpenFiles = true,
					outline = true,
					suggestFromUnimportedLibraries = true,
				},
				root_markers = { "pubspec.yaml", "pubspec.yml", "pubspec.lock", "pubspec.json" },
				settings = {
					dart = {
						completeFunctionCalls = true,
						showTodos = true,
					},
				},
			})

			-- activate lsp servers
			vim.lsp.enable(servers)

			-- activate individual server
			vim.lsp.enable("dartls")

			-- lsp keybinding
			local keymap = vim.keymap.set
			local opts = { buffer = bufnr, silent = true }

			keymap("n", "gD", vim.lsp.buf.declaration, opts)
			keymap("n", "gd", vim.lsp.buf.definition, opts)
			keymap("n", "K", vim.lsp.buf.hover, opts)
			keymap("n", "gi", vim.lsp.buf.implementation, opts)
			keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
			keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			keymap("n", "gr", vim.lsp.buf.references, opts)
			keymap("n", "gl", vim.diagnostic.open_float, opts)
			keymap("n", "<leader>dl", vim.diagnostic.setloclist, opts)
		end,
	},

	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = true,
		opts = {
			ui = {
				border = "rounded",
			},
			widget_guides = {
				enabled = true,
			},
		},
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
