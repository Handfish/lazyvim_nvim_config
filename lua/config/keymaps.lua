-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps are automatically loaded on the VeryLazy event
local map = vim.keymap.set

-- Your custom remaps
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Up" })

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to System Clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank Line to System Clipboard" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to Blackhole Register" })

map("i", "<C-c>", "<Esc>")
map("n", "Q", "<nop>")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace Word Under Cursor" })
map("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make Executable (chmod +x)" })
map("n", "<leader>r", "<cmd>set paste!<CR>", { desc = "Toggle Paste Mode" })

-- Buffer navigation
map("n", "<C-j>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
map("n", "<C-k>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "<C-n>", "<cmd>b#<CR>", { desc = "Switch to Last Buffer" })

map("n", "<C-;>", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
map("n", "<leader><C-;>", "<cmd>bdelete!<CR>", { desc = "Close Buffer (Force)" })

map("n", "<leader>h", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

-- Restore LSP Restart command
map("n", "<leader>0", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })

-- Restore Git-related commands
map("n", "<leader>2", "<cmd>exec 'cd' fnameescape(fnamemodify(finddir('.git', escape(expand('%:p:h'), ' ') . ';'), ':h'))<CR>", { desc = "CD to Git Root" })
map("n", "<leader>3", "<cmd>exec '!git add' fnameescape(fnamemodify(finddir('.git', escape(expand('%:p:h'), ' ') . ';'), ':h'))<CR>", { desc = "Git Add from Root" })

-- Restore Location List navigation
-- map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next Location" })
-- map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous Location" })

-- biome format
map("n", "<leader>bf", ":!biome check --write %<CR>", { desc = "Biome fix" })

map("n", "<leader>bz", function()
  vim.bo.tabstop = 2
  vim.bo.shiftwidth = 2
  vim.bo.softtabstop = 2
  vim.bo.expandtab = true
  vim.cmd("retab")
  print("Converted to 2-space tabs")
end, { desc = "Convert buffer to 2-space tabs" })

-- Compatible with LazyVim's Trouble setup (v3)
local trouble = require("trouble")

-- Helper: toggle a mode and focus if opened
local function toggle_trouble_mode(mode)
  local is_open = trouble.is_open(mode)

  if is_open then
    -- If already open, close it
    trouble.close(mode)
  else
    -- Otherwise open and focus
    trouble.open({ mode = mode, focus = true })
  end
end

-- <leader>qq → toggle Quickfix Trouble
-- map("n", "<leader>qq", function()
--   toggle_trouble_mode("quickfix")
-- end, { desc = "Quickfix (Trouble)" })

-- <leader>qa → toggle Diagnostics Trouble
map("n", "<leader>q", function()
  toggle_trouble_mode("diagnostics")
end, { desc = "Diagnostics (Trouble)" })

local telescope = require("telescope.builtin")
map("n", "<C-p>", function()
  telescope.git_files()
end, { desc = "Find Git Files" })


vim.keymap.del("n", "<leader>qq")

map("n", "<leader>q!", "<cmd>qa<cr>", { desc = "Quit All" })
