return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- add new null-ls.bultins.--- (if new language)
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "html", "json", "yaml", "markdown", "javascript", "json", "css" },
        }),
        null_ls.builtins.diagnostics.cpplint,
      },
    })

    -- keymaps for null-ls
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
