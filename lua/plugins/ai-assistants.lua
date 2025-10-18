return {
  -- GitHub Copilot
  -- { "github/copilot.vim", event = "InsertEnter" },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   opts = {
  --     suggestion = {
  --       enabled = not vim.g.ai_cmp,
  --       auto_trigger = true,
  --       hide_during_completion = vim.g.ai_cmp,
  --       keymap = {
  --         accept = false, -- handled by nvim-cmp / blink.cmp
  --         next = "<M-]>",
  --         prev = "<M-[>",
  --       },
  --     },
  --     panel = { enabled = false },
  --     filetypes = {
  --       markdown = true,
  --       help = true,
  --     },
  --   },
  -- },



----
  --{
  --  "zbirenbaum/copilot.lua",
  --  opts = {
  --    suggestion = {
  --      enabled = true,
  --      auto_trigger = true,
  --      hide_during_completion = vim.g.ai_cmp,
  --      keymap = {
  --        accept = false, -- handled by nvim-cmp / blink.cmp
  --        next = "<M-]>",
  --        prev = "<M-[>",
  --      },
  --    },
  --    panel = {
  --      enabled = true,
  --    },
  --    -- filetypes = {
  --    --   markdown = true,
  --    --   help = true,
  --    -- },
  --  },
  --},
---

{
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = vim.g.ai_cmp,
      debounce = 300, -- 👈 custom field we’ll use below
      keymap = {
        accept = false,
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = true },
  },
  config = function(_, opts)
    local copilot = require("copilot")
    local suggestion = require("copilot.suggestion")

    copilot.setup(opts)

    -- 👇 Debounce logic
    if opts.suggestion and opts.suggestion.auto_trigger and opts.suggestion.debounce then
      local timer
      vim.api.nvim_create_autocmd("TextChangedI", {
        callback = function()
          if timer then
            timer:stop()
            timer:close()
          end
          timer = vim.uv.new_timer()
          timer:start(opts.suggestion.debounce, 0, function()
            vim.schedule(function()
              suggestion.next()
            end)
          end)
        end,
      })
    end
  end,
},



  -- Avante.nvim for other AI providers
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    opts = {
      provider = "claude",
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-3-5-sonnet-20240620",
          extra_request_body = {
            temperature = 0,
            max_tokens = 4096,
          },
        },
      },
      mappings = {
        ask = "<leader>aa",
        edit = "<leader>ae",
        refresh = "<leader>ar",
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
      },
    },
  },
}
