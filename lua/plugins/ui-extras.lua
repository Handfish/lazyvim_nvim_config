return {
  {
    -- This plugin provides a much better markdown rendering engine
    "MeanderingProgrammer/render-markdown.nvim",
    -- Lazy-load it on markdown filetypes or when our TS plugin is used
    event = { "FileType markdown", "LspAttach" },
    config = function()
      require("render-markdown").setup({})
    end,
  },
}
