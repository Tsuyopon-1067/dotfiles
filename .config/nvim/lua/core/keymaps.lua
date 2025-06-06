-- 基本キーマッピング
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })

-- 新規行追加
vim.keymap.set('n', '<Leader>o', 'o<ESC>', { noremap = true, desc = 'Add newline below' })
vim.keymap.set('n', '<Leader>O', 'O<ESC>', { noremap = true, desc = 'Add newline above' })

-- ウィンドウナビゲーション
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- LSP関連
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename variable under cursor' })
vim.keymap.set('n', '<space>df', vim.diagnostic.open_float,
  { noremap = true, silent = true, desc = 'Open diagnostic floating window' })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist,
  { noremap = true, silent = true, desc = 'Open diagnostics list' })
