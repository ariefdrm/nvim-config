return {
  "oxfist/night-owl.nvim",
  lazy = true,   -- make sure we load this during startup if it is your main colorscheme
  priority = 0, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    require("night-owl").setup({
      -- These are the default settings
      bold = true,
      italics = true,
      underline = true,
      undercurl = true,
      transparent_background = false,
    })
    vim.cmd.colorscheme("night-owl")
  end,
}
