local M = {}
local api = vim.api

local function get_visual_selection()
  local mode = vim.fn.visualmode()
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"
  local start_line = start_pos[2] - 1
  local end_line = end_pos[2] - 1

  if mode == 'V' then
    local lines = api.nvim_buf_get_lines(0, start_line, end_line + 1, false)
    return table.concat(lines, '\n')
  end

  local lines = api.nvim_buf_get_lines(0, start_line, end_line + 1, false)
  if #lines == 0 then
    return ''
  end

  local start_col = start_pos[3] - 1
  local end_col = end_pos[3]

  if #lines == 1 then
    lines[1] = string.sub(lines[1], start_col + 1, end_col)
  else
    lines[1] = string.sub(lines[1], start_col + 1)
    lines[#lines] = string.sub(lines[#lines], 1, end_col)
  end

  return table.concat(lines, '\n')
end

local function replace_visual_selection(text)
  local mode = vim.fn.visualmode()
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"
  local start_line = start_pos[2] - 1
  local end_line = end_pos[2] - 1

  if mode == 'V' then
    api.nvim_buf_set_lines(0, start_line, end_line + 1, false, vim.split(text, '\n'))
    return
  end

  local start_col = start_pos[3] - 1
  local end_col = end_pos[3]

  if start_line == end_line then
    local line = api.nvim_buf_get_lines(0, start_line, start_line + 1, false)[1]
    local before = string.sub(line, 1, start_col)
    local after = string.sub(line, end_col + 1)
    api.nvim_buf_set_lines(0, start_line, start_line + 1, false, { before .. text .. after })
  else
    api.nvim_buf_set_lines(0, start_line, end_line + 1, false, vim.split(text, '\n'))
  end
end

local function url_encode(str)
  return str
    :gsub('\n', ' ')
    :gsub('[^%w ]', function(c)
      return string.format('%%%02X', string.byte(c))
    end)
    :gsub(' ', '+')
end

local function extract_translation(html)
  if not html then
    return nil
  end

  local pattern = 'class="result%-container".->(.-)<'
  local translation = html:match(pattern)

  if translation then
    translation = translation:gsub('&quot;', '"'):gsub('&amp;', '&'):gsub('&lt;', '<'):gsub('&gt;', '>'):gsub('&#(%d+);', function(n)
      return string.char(tonumber(n))
    end)
    return translation
  end
  return nil
end

local function async_http_get(url, callback)
  local cmd = {
    'curl',
    '-s',
    '-A',
    'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1',
    url,
  }

  vim.api.nvim_echo({ { 'Translating...', 'Normal' } }, false, {})

  local buffer = ''
  local job_id = vim.fn.jobstart(cmd, {
    on_stdout = function(_, data)
      if data then
        buffer = buffer .. table.concat(data, '\n')
      end
    end,
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        callback(buffer)
      else
        vim.schedule(function()
          print 'Translation failed: Could not connect to Google Translate'
        end)
      end
    end,
  })

  if job_id <= 0 then
    print 'Failed to start translation job'
  end
end

function M.translate(target_lang)
  print('Translating to ' .. (target_lang or 'English'))
  local text = get_visual_selection()
  if text == '' then
    print 'No text selected'
    return
  end

  local url = string.format('https://translate.google.com/m?sl=auto&tl=%s&q=%s', target_lang or 'en', url_encode(text))

  async_http_get(url, function(response)
    vim.schedule(function()
      local translation = extract_translation(response)
      if translation then
        replace_visual_selection(translation)
        print 'Translated successfully'
      else
        print 'Failed to extract translation'
      end
    end)
  end)
end

function M.setup()
  vim.api.nvim_set_keymap(
    'v',
    '<Leader>te',
    [[<cmd>lua require('plugins.google-translate').translate('en')<CR>]],
    { noremap = true, silent = true, desc = 'translate to english ' }
  )

  vim.api.nvim_set_keymap(
    'v',
    '<Leader>tj',
    [[<cmd>lua require('plugins.google-translate').translate('ja')<CR>]],
    { noremap = true, silent = true, desc = 'translate to japanese' }
  )
end

return M
