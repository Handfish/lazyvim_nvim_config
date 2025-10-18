return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- Context-aware commenting
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      ensure_installed = {
        "javascript", "solidity", "typescript", "rust", "c", "lua", "vim", "tsx",
        "toml", "yaml", "sql", "html", "astro", "dockerfile", "bash", "glsl",
        "go", "php", "graphql", "css", "scss",
      },
      -- Enable context commentstring after treesitter loads
      context_commentstring = {
        enable = true,
      },
    },
  },

  -- A playground for interacting with the Treesitter parse tree
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  -- Syntax support for misc filetypes Treesitter may not cover fully
  { "kchmck/vim-coffee-script", ft = "coffeescript" },
  { "tikhomirov/vim-glsl", ft = "glsl" },
}
