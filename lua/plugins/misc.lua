return {
  -- UndoTree for visualizing your undo history
  { "mbbill/undotree", cmd = "UndotreeToggle", keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" } } },

  -- Fugitive for Git integration
  { "tpope/vim-fugitive", cmd = "Git", keys = { { "<leader>gs", "<cmd>Git<CR>", desc = "Fugitive: Git Status" } } },

  -- Commentary for easy commenting
  { "tpope/vim-commentary", event = "VeryLazy" },

  -- Context-aware commenting for Treesitter
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "VeryLazy" },

  -- Highlight colors like #FFFFFF
  { "brenoprata10/nvim-highlight-colors", event = "VeryLazy" },

  -- Emmet for HTML/CSS
  { "mattn/emmet-vim", ft = { "html", "css", "typescriptreact", "javascriptreact" } },

  -- Manage Git conflicts
  { "akinsho/git-conflict.nvim", version = "*", config = true },
}
