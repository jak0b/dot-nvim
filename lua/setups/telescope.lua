local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
    },
    prompt_title = '',
    results_title = '',
    preview_title = '',
    winblend = 20,
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
  },
  pickers = {
    find_files = {
      find_command = { 'rg', '--files', '--hidden', '-g', '!node_modules/**', '-g', '!.git/**' },
    },
  },
}

telescope.load_extension 'dap'
