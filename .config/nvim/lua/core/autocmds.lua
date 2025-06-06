-- ファイルタイプごとの設定
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'ruby',
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = false
  end,
})

-- ヤンク時のハイライト
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = 'Highlight yanked text',
})

-- 診断設定（修正版）
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  callback = function()
    -- LSPクライアントが接続されているかチェック
    local clients = vim.lsp.get_clients { bufnr = 0 }
    for _, client in pairs(clients) do
      if client.server_capabilities.documentHighlightProvider then
        vim.lsp.buf.document_highlight()
        break
      end
    end
  end,
})

vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
  callback = function()
    vim.lsp.buf.clear_references()
  end,
})
