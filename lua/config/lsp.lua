-- LSP setup using Neovim 0.11+ native API (vim.lsp.config / vim.lsp.enable)
-- Diagnostics display
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Enable language servers here. Add the server names you have installed.
-- Configs ship with nvim-lspconfig; defaults work out of the box.
local servers = {
  "lua_ls",
  "gopls", -- Go
  "pyright", -- Python
  "ts_ls", -- JavaScript / TypeScript
  -- "rust_analyzer",
  -- "clangd",
}
for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

-- LSP keymaps + native completion, set per-buffer when a server attaches.
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local bufnr = args.buf
    local function map(keys, fn, desc)
      vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = desc })
    end

    map("gd", vim.lsp.buf.definition, "Goto Definition")
    map("gD", vim.lsp.buf.declaration, "Goto Declaration")
    map("gr", vim.lsp.buf.references, "References")
    map("gi", vim.lsp.buf.implementation, "Goto Implementation")
    map("K", vim.lsp.buf.hover, "Hover")
    map("<leader>rn", vim.lsp.buf.rename, "Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
    map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
    map("<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, "Format Buffer")

    -- Native autocompletion (Neovim 0.11+)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end
  end,
})
