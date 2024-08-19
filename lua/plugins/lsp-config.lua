return {
  -- lsp server config
  {
    "williamboman/mason.nvim",          -- Mason nvim
    dependencies = {
      "williamboman/mason-lspconfig.nvim", -- mason lsp config
    },
    lazy = lazy,
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "tsserver",
          "html",
          "omnisharp",
          -- "trivy",
          -- "stylua",
          -- "clang_format",
          -- "codelldb",
          -- "cpplint",
          -- "prettier",
        },
      })
    end,
  },

  -- Nvim lsp config
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.clangd.setup({
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_pattern = {
          ".clangd",
          ".clang-tidy",
          ".clang-format",
          "compile_commands.json",
          "compile_flags.txt",
          "configure.ac",
          ".git",
        },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      lspconfig.html.setup({
        capabilities = capabilities,
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })

      -- keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    end,
  },
}
