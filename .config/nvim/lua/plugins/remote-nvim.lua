return {
  'amitds1997/remote-nvim.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    ssh_config = {
      ssh_binary = 'ssh',
      scp_binary = 'scp',
      ssh_config_file_paths = { '$HOME/.ssh/config' },
      ssh_prompts = {
        {
          match = 'Enter passphrase for key',
          type = 'secret',
          value_type = 'static',
          value = '',
        },
        {
          match = 'password:',
          type = 'secret',
          value_type = 'static',
          value = '',
        },
        {
          match = 'continue connecting (yes/no/[fingerprint])?',
          type = 'plain',
          value_type = 'static',
          value = 'yes',
        },
      },
    },
  },
}
