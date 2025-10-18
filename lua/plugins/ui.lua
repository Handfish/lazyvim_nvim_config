return {
  -- Configure Telescope with your custom keymaps
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      -- { "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
      -- {
      --   "<leader>ps",
      --   function()
      --     require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      --   end,
      --   desc = "Grep for String",
      -- },
    },
  },

  -- LazyVim includes and configures autopairs by default
  -- We only need to specify it if we want to override opts
  { "windwp/nvim-autopairs", opts = {} },

  -- LazyVim includes and configures indent-blankline by default
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  {
    "nvim-mini/mini.surround",
    opts = {}, -- We can override options here if needed
  },
}
