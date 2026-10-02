return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- Directs the command line to the traditional bottom bar
      opts.views = opts.views or {}
      opts.views.cmdline_popup = {
        position = {
          row = "100%",
          col = 0,
        },
        border = {
          style = "none",
        },
      }
      -- Alternatively, use the built-in bottom search and turn off the popup palette
      -- opts.presets = opts.presets or {}
      -- opts.presets.bottom_search = true
      -- opts.presets.command_palette = false
    end,
  },
}
