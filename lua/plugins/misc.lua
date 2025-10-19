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
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufRead",
    config = function()
      require("nvim-highlight-colors").setup({
        ---Render style
        ---@usage 'background'|'foreground'|'virtual'
        render = 'background',

        ---Set virtual symbol (requires render to be set to 'virtual')
        virtual_symbol = '■',

        virtual_symbol_position = 'inline',

        ---Highlight named colors, e.g. 'green'
        enable_named_colors = true,

        ---Highlight tailwind colors, e.g. 'bg-blue-500'
        enable_tailwind = true,

        ---Set custom colors
        ---Label must be properly escaped with '%' to adhere to `string.gmatch`
        --- :help string.gmatch
        custom_colors = {
          { label = '%-%-theme%-primary%-color', color = '#0f1219' },
          { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
        }
      })
    end,
  },

  -- Manage Git conflicts
  { "akinsho/git-conflict.nvim", version = "*", config = true },
}
