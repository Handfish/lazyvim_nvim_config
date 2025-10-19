-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function(args)
    local filepath = args.file
    -- Run biome formatting on disk
    vim.fn.jobstart({ "biome", "check", "--write", filepath }, {
      on_exit = function()
        -- Silently reload buffer if file changed
        if vim.fn.filereadable(filepath) == 1 then
          local view = vim.fn.winsaveview() -- remember cursor position
          vim.cmd("checktime")               -- check if file changed on disk
          vim.cmd("edit!")                   -- reload file contents
          vim.fn.winrestview(view)           -- restore cursor position
        end
      end,
    })
  end,
})

