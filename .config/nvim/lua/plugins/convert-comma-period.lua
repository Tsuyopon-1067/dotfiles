function ConvertToCommaPeriod()
  vim.cmd '%s/、/，/ge'
  vim.cmd '%s/。/．/ge'
end

function ConvertToCommaPeriodWords()
  vim.cmd '%s/、/，/ge'
  vim.cmd '%s/。/．/ge'
  vim.cmd '%s/トレーニング/学習/ge'
end

vim.api.nvim_set_keymap('n', 'cmp', ':lua ConvertToCommaPeriod()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'cma', ':lua ConvertToCommaPeriodWords()<CR>', { noremap = true, silent = true })
