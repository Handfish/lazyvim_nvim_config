return {
  "folke/noice.nvim",
  opts = {
    routes = {
      {
        filter = {
          event = "notify",
          find = "Copilot.*disabled",
        },
        opts = { skip = true },
      },
    },
  },
}
