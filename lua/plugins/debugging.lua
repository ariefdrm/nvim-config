return {
	{
		"mfussenegger/nvim-dap",
		lazy = verylazy,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"mason-org/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			require("dapui").setup()

			-- dap ui config
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- configurations dap/debugger for c/c++/rust
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					-- CHANGE THIS to your path!
					command = "/home/arief/.local/share/nvim/mason/bin/codelldb",
					args = { "--port", "${port}" },
					name = "codelldb",

					-- On windows you may have to uncomment this:
					detached = false,
				},
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
					runInTerminal = true,
				},
			}
			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			-- javascript / typescript debugger
			dap.adapters["dap-vscode-js"] = {
				debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal" },
			}

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					-- 💀 Make sure to update this path to point to your installation
					args = {
						"/home/arief/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
			}

			dap.configurations.javascript = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}

			dap.configurations.typescript = dap.configurations.javascript

			-- keymaps
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>dc", dap.continue, {})
			vim.keymap.set("n", "<leader>ds", dap.step_over, {})
			vim.keymap.set("n", "<leader>di", dap.step_into, {})
			vim.keymap.set("n", "<leader>do", dap.step_out, {})
			vim.keymap.set("n", "<leader>dl", dap.run_last, {})
			vim.keymap.set("n", "<leader>dt", dap.terminate, {})
		end,
	},
}
