local function set_python_venv()
  local custom_path = vim.fn.input('Enter venv directory path (default: venv): ', '', 'dir')
  if custom_path == '' then
    return
  end

  local venv_path = vim.fn.fnamemodify(custom_path, ':p')
  local python_path = venv_path .. 'bin/python3'

  print '\nデバッグ情報:'
  print('仮想環境のパス: ' .. venv_path)
  print('Pythonインタープリタパス: ' .. python_path)

  if vim.fn.executable(python_path) == 1 then
    require('lspconfig').pyright.setup {
      settings = {
        python = {
          pythonPath = python_path,
        },
      },
    }
    vim.cmd 'LspRestart'
    print '設定が完了しました'
  else
    print 'エラー: Pythonインタープリタが見つかりません'
  end
end

vim.keymap.set('n', 'gpyv', set_python_venv, { noremap = true, silent = false })
