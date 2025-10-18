return {
  {
    "kdheepak/lazygit.nvim",
    -- The plugin is lazy-loaded on one of the following commands
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional dependencies
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- configure the keymap
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
    },
  },
}
