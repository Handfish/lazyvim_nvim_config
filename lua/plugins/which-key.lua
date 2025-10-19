return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.delay = function(ctx)
      -- Uncomment to debug what we're receiving
      -- vim.print("keys: " .. (ctx.keys or "nil") .. ", mode: " .. ctx.mode)
      
      if ctx.keys and vim.tbl_contains({ "d", "y", "c" }, ctx.keys) then
        return 3000
      end
      
      if ctx.mode == "o" then
        return 3000
      end
      
      return 300
    end
    return opts
  end,
}
