-- mason.nvim: LSP 서버/도구 자동 설치 관리자
-- lsp.lua 의 servers 목록에 맞춰 서버 바이너리를 자동 설치한다.
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- nvim-lspconfig 의 서버 이름 기준
      ensure_installed = {
        "lua_ls", -- Lua
        "gopls", -- Go
        "pyright", -- Python
        "ts_ls", -- JavaScript / TypeScript
      },
      -- 설치된 서버는 vim.lsp.enable 로 자동 활성화 (mason-lspconfig v2)
      automatic_enable = true,
    },
  },
}
