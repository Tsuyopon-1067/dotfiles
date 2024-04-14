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
  cmp = 'go build ' .. vim.fn.expand '%:p'
  ex = './' .. vim.fn.expand '%:r'
elseif ext == 'py' then
  ex = 'python3 ' .. vim.fn.expand '%:p'
elseif ext == 'rs' then
  ex = 'cd ../&&cargo run --bin ' .. vim.fn.expand '%:r'
elseif ext == 'js' then
  ex = 'node ' .. vim.fn.expand '%:p'
end

function TermRunnerRun()
  local filename = vim.fn.expand '%:t'
  local extension = filename:match '^.+%.(.+)$'
  local supported_extensions = { 'cpp', 'c', 'java', 'go', 'python', 'rs', 'javascript' }
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
