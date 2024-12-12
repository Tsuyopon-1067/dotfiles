-- マッピング
-- vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>o', 'o<ESC>', { noremap = true, desc = 'Add newline below' })
vim.keymap.set('n', '<Leader>O', 'O<ESC>', { noremap = true, desc = 'Add newline above' })
