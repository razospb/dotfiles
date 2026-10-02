return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- Ensure completion is enabled for cmdline
    opts.completion = opts.completion or {}
    opts.completion.keyword = opts.completion.keyword or {}
    
    -- Set the minimum keyword length to 0 to trigger immediately on any keystroke
    opts.completion.keyword.range = "prefix"

    -- Configure cmdline specific behavior
    opts.cmdline = {
      enabled = true,
      completion = {
        menu = { auto_show = true }, -- Automatically show the menu
        ghost_text = { enabled = true }, -- Optional: show ghost text
      },
    }

    -- Trigger completion immediately on keypress in cmdline mode
    opts.keymap = opts.keymap or {}
    -- This ensures default mappings don't override the automatic triggering
    
    return opts
  end,
}

