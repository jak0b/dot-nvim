require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close,
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

require('telescope').load_extension 'dap'
