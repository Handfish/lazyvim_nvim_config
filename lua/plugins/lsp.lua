return {
  {
    "neovim/nvim-lspconfig",
    ---@param opts PluginLspOpts
    opts = function(_, opts)
      -- Add solidity server
      opts.servers = opts.servers or {}
      opts.servers.solidity = {
        cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
        filetypes = { "solidity" },
        root_dir = require("lspconfig.util").find_git_ancestor,
        single_file_support = true,
      }
      
      return opts
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      -- This creates a new autocmd that runs when LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf
          local filetype = vim.bo[bufnr].filetype
          
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true, desc = desc })
          end
          
          if filetype == "typescript" or filetype == "typescriptreact" then
            map("n", "<leader>ic", function()
              require("utils.effect").fill_effect_cases(bufnr, client)
            end, "Effect: Insert Cases")
          end
          
          if client and client.name == "rust_analyzer" then
            map("n", "<leader>;", function()
              vim.cmd.RustLsp("codeAction")
            end, "Rust Code Action")
          end
        end,
      })
    end,
  },
}
