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
				"cssls", -- Css
				"emmet_ls", -- emmet_ls
				-- "pyright", -- Python
				-- "clangd", -- C/C++
				-- "dartls", -- Dart
				"vue_ls",
				"intelephense",
				"laravel_ls",
				"tailwindcss",
				"vtsls",
			}

			require("mason-lspconfig").setup({
				automatic_enable = false,
				ensure_installed = {
					"lua_ls",
				},
			})
			--Enable (broadcasting) snippet capability for completion
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

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

			vim.lsp.config("html", {
				capabilities = capabilities,
				filetypes = { "html", "css", "ejs", "javascript", "javascriptreact", "typescript", "typescriptreact" },
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
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "vue" },
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
			-- vim.lsp.enable("dartls")
			-- vim.lsp.enable("pyright")

			-- vim lsp diagnostic
			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				signs = {
					severity = {
						min = vim.diagnostic.severity.WARN,
						max = vim.diagnostic.severity.ERROR,
					},

					float = {
						focusable = false,
						style = "minimal",
						border = "rounded",
						source = "always",
					},

					signs = {
						hint = "",
						info = "",
						warn = "",
						error = "",
					},
				},
			})

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

	-- typescript-tools
	-- {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- 	opts = {},
	-- },

	-- flutter
	-- {
	-- 	"nvim-flutter/flutter-tools.nvim",
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"stevearc/dressing.nvim", -- optional for vim.ui.select
	-- 	},
	-- 	config = true,
	-- 	opts = {
	-- 		ui = {
	-- 			border = "rounded",
	-- 		},
	-- 		widget_guides = {
	-- 			enabled = true,
	-- 		},
	-- 	},
	-- },

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
