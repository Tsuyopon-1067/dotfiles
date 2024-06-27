-- 文字コードをUFT-8に設定
vim.o.fileencoding = 'utf-8'

-- バックアップファイルを作らない
vim.o.backup = false

-- スワップファイルを作らない
vim.o.swapfile = false

-- 編集中のファイルが変更されたら自動で読み直す
vim.o.autoread = true

-- バッファが編集中でもその他のファイルを開けるように
vim.o.hidden = true

-- 入力中のコマンドをステータスに表示する
vim.o.showcmd = true

-- 行番号を表示
vim.wo.relativenumber = true

-- 現在の行を強調表示
vim.wo.cursorline = true

-- 現在の行を強調表示（縦）
vim.wo.cursorcolumn = true

-- 行末の1文字先までカーソルを移動できるように
vim.o.virtualedit = 'onemore'

-- インデントはスマートインデント
vim.o.smartindent = true

-- 括弧入力時の対応する括弧を表示
vim.o.showmatch = true

-- ステータスラインを常に表示
vim.o.laststatus = 2

-- コマンドラインの補完
vim.o.wildmode = 'list:longest'

-- シンタックスハイライトの有効化
vim.cmd 'syntax enable'

-- 折りたたみ
-- vim.wo.foldmethod = "indent"
vim.g.Tex_AutoFolding = 0

-- タブ系設定
vim.o.list = true
vim.o.listchars = 'tab:▸-'
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- 検索系設定
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.wrapscan = true
vim.o.hlsearch = true

-- クリップボード設定
vim.o.clipboard = 'unnamed,unnamedplus'

-- 全コピー
vim.api.nvim_set_keymap('n', 'cy', ':%y<Enter>', { noremap = true, silent = true })

-- 囲む
vim.api.nvim_set_keymap('n', 'cq', 'dwi"<Esc>p', { noremap = true, silent = true })

-- タブ設定
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- ファイルタイプごとのインデント設定
vim.cmd [[
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb set noexpandtab
augroup END
]]
-- autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
-- autocmd BufNewFile,BufRead *.py set noexpandtab

-- vim.cmd.colorscheme 'molokai'
