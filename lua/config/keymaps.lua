-- Key mappings (migrated from init.vim)
local map = vim.keymap.set

-- Tagbar
map("n", "<F8>", "<cmd>TagbarToggle<CR>", { desc = "Toggle Tagbar" })

-- Neo-tree file explorer (also available via <leader>e)
map("n", "<F7>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
