return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- keep the existing mode component
    local mode = opts.sections.lualine_a[1]

    -- replace it with a custom function that adds "(P)" if paste mode is on
    opts.sections.lualine_a[1] = {
      function()
				local m = " " .. vim.fn.mode():upper()
        if vim.o.paste then
          return m .. " (P)"
        end
        return m
      end,
      icon = mode.icon, -- preserve icon if defined
    }

    return opts
  end,
}
