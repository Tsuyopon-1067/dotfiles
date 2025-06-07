return {
  'nvim-tree/nvim-tree.lua',
  cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
  },
  lazy = true,
  config = function()
    require('nvim-tree').setup {
      git = {
        ignore = false,
      },
    }
  end
}
