-- Plugin specs (migrated from init.vim vim-plug list)
return {
  -- Treesitter: syntax highlighting / parsing
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- LSP configurations (uses Neovim 0.11+ native vim.lsp.enable API)
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp")
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },

  -- Tag browser
  { "preservim/tagbar" },

  -- Icons
  { "nvim-tree/nvim-web-devicons" },

  -- Git interface
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    config = true,
  },

  -- Diff view
  { "sindrets/diffview.nvim" },
}
