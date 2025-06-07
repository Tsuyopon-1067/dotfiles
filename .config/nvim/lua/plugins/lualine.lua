return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = function()
    local colors = {
      base3 = '#002b36',
      base2 = '#073642',
      base1 = '#69848c',
      base0 = '#657b83',
      base00 = '#839496',
      base01 = '#93a1a1',
      base02 = '#d8e3e6',
      base03 = '#fdf6e3',
      yellow = '#b58900',
      orange = '#cb4b16',
      red = '#ff4000',
      magenta = '#ff6b9f',
      violet = '#6c71c4',
      blue = '#0fa3ff',
      cyan = '#2aa198',
      green = '#00d17a',
    }
    local custom_theme = {
      normal = {
        a = { fg = colors.base03, bg = colors.blue, gui = 'bold' },
        b = { fg = colors.base03, bg = colors.base1 },
        c = { fg = colors.base1, bg = colors.base02 },
      },
      insert = { a = { fg = colors.base03, bg = colors.green, gui = 'bold' } },
      visual = { a = { fg = colors.base03, bg = colors.magenta, gui = 'bold' } },
      replace = { a = { fg = colors.base03, bg = colors.red, gui = 'bold' } },
      inactive = {
        a = { fg = colors.base0, bg = colors.base02, gui = 'bold' },
        b = { fg = colors.base03, bg = colors.base00 },
        c = { fg = colors.base01, bg = colors.base02 },
      },
    }
    return {
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = custom_theme,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      },
    }
  end
}
