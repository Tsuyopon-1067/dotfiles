-- 最初にlazy.nvimを初期化
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Luaモジュール検索パスを追加
package.path = package.path .. ';' .. vim.fn.stdpath 'config' .. '/lua/?.lua'

-- 基本設定をcoreモジュールから読み込み
require 'core'

-- lazy.nvimでプラグインを管理
require 'plugins.lazy'

-- 自作プラグインの読み込み
require 'plugins.convert-comma-period'
require 'plugins.t-term'
require 'plugins.term-runner'
require('plugins.google-translate').setup()
require 'plugins.venv-reader'
