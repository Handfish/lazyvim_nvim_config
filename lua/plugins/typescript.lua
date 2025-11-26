return {
  "youyoumu/pretty-ts-errors.nvim",
  event = "LspAttach",
  opts = {
    auto_open = true,
  },
  config = function(_, opts)
    local pte = require("pretty-ts-errors")
    pte.setup(opts)

    -- Show formatted error
    vim.keymap.set("n", "<leader>te", function()
      pte.show_formatted_error()
    end, { desc = "Show TS error" })

    -- Show all errors
    vim.keymap.set("n", "<leader>tE", function()
      pte.open_all_errors()
    end, { desc = "Show all TS errors" })

    -- Toggle auto-open via TS plugin's API
    vim.keymap.set("n", "<leader>tt", function()
      pte.toggle_auto_open()
    end, { desc = "Toggle TS error auto-display" })

    -- ⭐ Your custom toggle on <leader>8
    vim.keymap.set("n", "<leader>8", function()
      pte.toggle_auto_open()
    end, { desc = "Toggle TS error auto-display (<leader>8)" })
  end,
}
