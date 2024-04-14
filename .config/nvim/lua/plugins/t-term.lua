-- ターミナルの展開
function MakeTerm()
  vim.cmd 'split'
  vim.cmd 'wincmd j'
  vim.cmd 'resize 12'
  vim.cmd 'terminal'
  vim.api.nvim_feedkeys('i', 'n', true)
end

vim.api.nvim_set_keymap('n', '<C-`>', ':lua MakeTerm()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-@>', ':lua MakeTerm()<CR>', { noremap = true, silent = true })
