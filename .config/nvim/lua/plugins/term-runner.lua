-- ターミナルの展開
function MakeTerm()
  vim.cmd 'split'
  vim.cmd 'wincmd j'
  vim.cmd 'resize 12'
  vim.cmd 'terminal'
  vim.api.nvim_feedkeys('i', 'n', true)
end

local ext = vim.fn.expand '%:e'
local cmp = ''
local ex = ''

if ext == 'cpp' then
  cmp = 'g++ -O0 -o ' .. vim.fn.expand '%:r' .. '.out ' .. vim.fn.expand '%:p'
  ex = './' .. vim.fn.expand '%:r' .. '.out'
elseif ext == 'c' then
  cmp = 'gcc -O0 -o ' .. vim.fn.expand '%:r' .. '.out ' .. vim.fn.expand '%:p'
  ex = './' .. vim.fn.expand '%:r' .. '.out'
elseif ext == 'java' then
  cmp = 'javac ' .. vim.fn.expand '%:p'
  ex = 'java ' .. vim.fn.expand '%:r'
elseif ext == 'go' then
  -- cmp = 'go build ' .. vim.fn.expand '%:p'
  ex = 'go run ' .. vim.fn.expand '%:p'
elseif ext == 'py' then
  ex = 'python3 ' .. vim.fn.expand '%:p'
elseif ext == 'lua' then
  ex = 'lua ' .. vim.fn.expand '%:p'
elseif ext == 'rs' then
  local current_directory = vim.api.nvim_eval "expand('%:p:h')"
  local current_parts = {}
  for part in current_directory:gmatch '[^/]+' do
    table.insert(current_parts, part)
  end
  local file_full_path = vim.api.nvim_eval "expand('%:p')"
  local file_parts = {}
  for part in file_full_path:gmatch '[^/]+' do
    table.insert(file_parts, part)
  end
  -- srcの1つ上のディレクトリに移動する
  -- 開いているファイルからsrcディレクトリまでいくつ上か調べる
  local offset_file_src = 0
  while file_parts[#file_parts - offset_file_src] ~= 'src' and offset_file_src <= #file_parts do
    offset_file_src = offset_file_src + 1
  end
  -- 今のファイル分1つ大きいので修正する
  offset_file_src = offset_file_src - 1
  -- srcの1つ上のディレクトリ名がcargo_name
  local cargo_name = current_parts[#current_parts - offset_file_src - 1]
  local cd_commands = 'cd ..'
  local offset_current_src = offset_file_src - (#file_parts - #current_parts)
  if offset_current_src >= 1 then
    local i = offset_file_src
    while i > 1 do
      cd_commands = cd_commands .. '/..'
      i = i - 1
    end
  else
    cd_commands = ''
  end
  if file_parts[#file_parts - offset_file_src] == 'bin' then
    ex = cd_commands .. 'cargo run --bin ' .. vim.fn.expand '%:t:r'
  else
    ex = cd_commands .. 'cargo run --bin ' .. cargo_name
  end
elseif ext == 'js' then
  ex = 'node ' .. vim.fn.expand '%:p'
end

function TermRunnerRun()
  local filename = vim.fn.expand '%:t'
  local extension = filename:match '^.+%.(.+)$'
  local supported_extensions = { 'cpp', 'c', 'java', 'go', 'py', 'rs', 'javascript', 'lua' }
  if not vim.tbl_contains(supported_extensions, extension) then
    return
  end

  vim.cmd 'w'
  MakeTerm()
  vim.api.nvim_feedkeys(cmp .. '\n' .. ex .. '\n', 'n', true)
end

vim.cmd [[
    augroup TerminalAutocompile
        autocmd!
        autocmd FileType cpp,c,cpp,java,go,python,rs,javascript nnoremap <buffer> <F5> :lua TermRunnerRun()<CR>
    augroup END
]]
vim.api.nvim_set_keymap('n', '<F5>', ':lua TermRunnerRun()<CR>', { noremap = true, silent = true })
