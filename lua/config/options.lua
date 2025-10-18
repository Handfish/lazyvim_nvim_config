-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Your preferred tab settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Your other settings from set.lua
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50 -- Faster update time for plugins like gitsigns
vim.opt.signcolumn = "yes" -- Always show the sign column

-- Neovide specific settings
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.opt.guifont = "UbuntuMono Nerd Font:h18"

-- Enable filetype plugins and indentation
vim.cmd([[filetype plugin indent on]])

-- Set filetype-specific indentation for gdscript
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gdscript",
  callback = function()
    vim.bo.expandtab = false -- use tabs, not spaces
    vim.bo.tabstop = 2 -- 1 tab == 2 spaces visually
    vim.bo.shiftwidth = 2 -- indentation amount when using >> or <<
    vim.bo.softtabstop = 2 -- how many spaces a <Tab> counts for while editing
  end,
})
