local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', 'https://github.com/folke/lazy.nvim.git', lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- 基本プラグイン（最初に読み込む）
  'tpope/vim-sleuth',
  { 'numToStr/Comment.nvim', opts = {} },

  -- UI関連プラグイン
  require('plugins.lualine'),
  require('plugins.nvim-tree'),
  require('plugins.telescope'),
  require('plugins.which-key'),

  -- 編集支援
  require('plugins.autopairs'),
  require('plugins.nvim-autopairs'),
  require('plugins.treesitter'),
  require('plugins.nvim-ts-autotag'),

  -- LSP関連
  require('plugins.lsp-config'),
  require('plugins.conform'),
  require('plugins.copilot'),
  require('plugins.copilot-chat'),
  require('plugins.nvim-cmp'),

  -- Git関連
  require('plugins.git'),
  require('plugins.gitsigns'),

  -- ユーティリティ
  require('plugins.todo-comments'),
  require('plugins.mini'),

  -- カラースキーム
  require('plugins.deepwhite'),

  -- ファイルタイプ固有
  require('plugins.typst')
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘', config = '🛠', event = '📅', ft = '📂',
      init = '⚙', keys = '🗝', plugin = '🔌', runtime = '💻',
      require = '🌙', source = '📄', start = '🚀', task = '📌', lazy = '💤 '
    }
  }
})
