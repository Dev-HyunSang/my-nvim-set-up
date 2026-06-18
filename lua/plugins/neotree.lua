-- neo-tree file explorer
-- ref: https://zunione.github.io/neovim-lazy-neotree/
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
  },
  opts = {
    enable_diagnostics = false,
    filesystem = {
      filtered_items = {
        visible = true,
        dotfiles = false,
        git_ignored = false,
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          added = "●",
          modified = "●",
          deleted = "●",
          renamed = "●",
          untracked = "●",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "●",
        },
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    vim.cmd([[
      highlight NeoTreeGitModified guifg=#E2C08D
      highlight NeoTreeGitUntracked guifg=#73C991
      highlight NeoTreeGitAdded guifg=#73C991
      highlight NeoTreeGitDeleted guifg=#E06C75
      highlight NeoTreeGitConflict guifg=#E06C75
      highlight NeoTreeDotFile guifg=#8C8C8C
      highlight NeoTreeFilteredItem guifg=#8C8C8C
    ]])

    vim.api.nvim_create_autocmd("VimEnter", {
      pattern = "*",
      group = vim.api.nvim_create_augroup("neotree_on_startup", { clear = true }),
      callback = function()
        vim.cmd("Neotree")
      end,
    })
  end,
}
