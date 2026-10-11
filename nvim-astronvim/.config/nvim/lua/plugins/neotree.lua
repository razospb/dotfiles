return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.wo.relativenumber = true
          vim.wo.cursorline = true
          vim.wo.cursorlineopt = "number"
        end,
      },
    },
  },
}
