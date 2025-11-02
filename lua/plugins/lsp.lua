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
					"prettier",
					"stylua",
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
			"mason-org/mason-registry",
		},
		config = function()
			-- List of LSP servers
			local servers = {
				"lua_ls", -- Lua
				-- "dartls", -- dart
				"vue_ls", -- vue
				"vtsls", -- javascript/typescript
				"gopls", -- go lang
				"emmet_ls", -- emmet
				"html", -- html
				"cssls", -- css
				"tailwindcss", -- tailwindcss
			}

			require("mason-lspconfig").setup({
				automatic_enable = false,
				ensure_installed = {
					"lua_ls",
					"html",
					"cssls",
					"emmet_ls",
					"vtsls",
				},
			})

			-- --Enable (broadcasting) snippet capability for completion
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			local vue_ls_config = {
				on_init = function(client)
					client.handlers["tsserver/request"] = function(_, result, context)
						local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
						if #clients == 0 then
							vim.notify(
								"Could not find `vtsls` lsp client, `vue_ls` would not work without it.",
								vim.log.levels.ERROR
							)
							return
						end
						local ts_client = clients[1]

						local param = unpack(result)
						local id, command, payload = unpack(param)
						ts_client:exec_cmd({
							title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
							command = "typescript.tsserverRequest",
							arguments = {
								command,
								payload,
							},
						}, { bufnr = context.bufnr }, function(_, r)
							local response_data = { { id, r.body } }
							---@diagnostic disable-next-line: param-type-mismatch
							client:notify("tsserver/response", response_data)
						end)
					end
				end,
			}

			-- local mason_registry = require("mason-registry")

			local vue_language_server_path = vim.fn.expand("$MASON/packages")
				.. "/vue-language-server"
				.. "/node_modules/@vue/language-server"

			local vue_plugin = {
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
				configNamespace = "typescript",
			}

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

			-- html
			vim.lsp.config("html", {
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"vue",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			})

			-- emmet ls
			vim.lsp.config("emmet_ls", {
				filetypes = {
					"astro",
					"css",
					"eruby",
					"html",
					"htmlangular",
					"htmldjango",
					"javascriptreact",
					"less",
					"pug",
					"sass",
					"scss",
					"svelte",
					"templ",
					"typescriptreact",
					"vue",
				},
			})

			-- css
			vim.lsp.config("cssls", {
				filetypes = { "css", "scss", "less", "html", "vue" },
				settings = {
					css = {
						lint = {
							unknownAtRules = "ignore",
						},
					},
				},
			})

			-- javascript / typescript
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

			-- javascript / typescript
			vim.lsp.config("vtsls", {
				settings = {
					vtsls = {
						tsserver = {
							globalPlugins = {
								vue_plugin,
							},
						},
					},
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			})

			-- vue lsp
			vim.lsp.config("vue_ls", vue_ls_config)

			--  dart
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

			-- php
			vim.lsp.config("intelephense", {
				filetypes = { "php", "blade" },
				root_markers = { "composer.json", "composer.lock", ".git" },
				settings = {
					intelephense = {
						files = {
							maxSize = 5000000, -- 5MB
						},
						diagnostics = {
							enable = true,
							ignoreCodes = { 10006, 10007 }, -- Ignore specific diagnostic codes
						},
					},
				},
			})

			vim.lsp.config("rust_analyzer", {
				cmd = { "rust-analyzer" },
				filetypes = { "rust" },
				settings = {
					["rust-analyzer"] = {
						cargo = {
							loadOutDirsFromCheck = true,
						},
						diagnostics = {
							enable = true,
						},
					},
				},
			})

			-- activate lsp servers
			-- vim.lsp.enable(enableServers)
			for _, value in pairs(servers) do
				vim.lsp.enable(value)
			end

			-- activate individual server
			vim.lsp.enable("pyright")
			vim.lsp.enable("rust_analyzer")

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
			keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			keymap("n", "gr", vim.lsp.buf.references, opts)
			keymap("n", "gl", vim.diagnostic.open_float, opts)
			keymap("n", "<leader>dL", vim.diagnostic.setloclist, opts)
		end,
	},

	-- lazydev.nvim
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
