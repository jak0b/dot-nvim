require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close,
        ['<c-d>'] = require('telescope.actions').delete_buffer
      },
      n = { ['<c-d>'] = require('telescope.actions').delete_buffer }
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

-- require('telescope').load_extension 'dap'
