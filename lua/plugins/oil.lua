return {
  "stevearc/oil.nvim",
  opts = {
    view_options = {
      show_hidden = true, -- show hidden files
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-mini/mini.icons" },
  config = function(_, opts)
    require("oil").setup(opts)

    -- Your custom user command to open oil in the current file's directory
    vim.api.nvim_create_user_command("E", function()
      local buf_dir = vim.fn.expand("%:p:h")
      if buf_dir == "" then
        buf_dir = vim.loop.cwd()
      end
      require("oil").open(buf_dir)
    end, {})

    -- Keymap for opening oil (replaces Dirbuf)
    vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Open parent directory with Oil" })
  end,
}
