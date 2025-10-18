return {
  {
    "sainnhe/everforest",
    priority = 1000,
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_colors_override = {
        bg0 = { "#1B2023", "235" },
        fg = { "#e0d7c3", "223" },
        aqua = { "#94c9a1", "108" },
        blue = { "#98c8c2", "109" },
      }
      vim.cmd.colorscheme("everforest")

      -- Custom highlight groups
      vim.api.nvim_set_hl(0, "DiffText", { fg = "#1c2a3a", bg = "#1c2a3a", bold = true })
      vim.api.nvim_set_hl(0, "GitConflictCurrentLabel", { bg = "#152028" })
      vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#1a262f" })
      vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#707875" })
    end,
  },
}
