-- 基本設定
vim.o.fileencoding = 'utf-8'
vim.o.backup = false
vim.o.swapfile = false
vim.o.autoread = true
vim.o.hidden = true
vim.o.showcmd = true

-- 表示設定
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.o.virtualedit = 'onemore'
vim.o.laststatus = 2
vim.o.showmatch = true

-- インデント設定
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.list = true
vim.o.listchars = 'tab:▸-'

-- 検索設定
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.wrapscan = true
vim.o.hlsearch = true

-- undoを永続化する設定
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand '~/.config/nvim/undo'

-- クリップボード設定
vim.o.clipboard = 'unnamed,unnamedplus'

-- シンタックスハイライト
vim.cmd 'syntax enable'

-- ファイルタイプごとの設定 (後でautocmds.luaに移動予定)
vim.cmd [[
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb set noexpandtab
augroup END
]]
