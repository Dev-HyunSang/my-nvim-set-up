-- conform.nvim: 저장 시 자동 포맷팅
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = { "n", "v" },
        desc = "Format Buffer",
      },
    },
    opts = {
      -- 파일 타입별 포맷터 (왼쪽부터 순서대로 실행)
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        python = { "ruff_organize_imports", "ruff_format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
      },
      -- 저장할 때 자동 포맷. 전용 포맷터가 없으면 LSP 포맷으로 폴백.
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
    },
  },

  -- 포맷터 CLI 자동 설치
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "stylua", -- Lua
        "goimports", -- Go
        "ruff", -- Python (포맷 + import 정렬)
        "prettier", -- JS / TS / JSON
      },
    },
  },
}
