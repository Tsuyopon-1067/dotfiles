-- 基本設定モジュールのエントリポイント
require('core.settings')
require('core.keymaps')
require('core.autocmds')

-- プラグイン以外の基本設定をここに追加
vim.g.mapleader = ' '
vim.g.have_nerd_font = true
vim.opt.termguicolors = true
