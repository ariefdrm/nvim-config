return {
  window = {
    position = "right",
  },
  -- fill any relevant options here
  event_handlers = {
    -- Auto close on open file
    {
      event = "file_open_requested",
      handler = function()
        -- auto close
        vim.cmd("Neotree close")
        -- OR
        -- require("neo-tree.command").execute({ action = "close" })
      end,
    },
  },
  filesystem = {
    filtered_items = {
      visible = true, -- Set to true to show filtered items (including hidden files)
      hide_dotfiles = false, -- Explicitly set to false to always show dotfiles
      hide_gitignored = true, -- You can choose whether to hide gitignored files or not
    },
  },
}
