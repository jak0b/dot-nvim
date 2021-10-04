local telescope = require('telescope')

local actions = require('telescope.actions')

local function set_map(map, cmd_name)
  return vim.api.nvim_set_keymap('n', map, "<cmd>lua require('telescope.builtin')."..cmd_name.."()<cr>", {
    noremap = true, silent = true
  })
end

set_map('<C-p>', 'find_files')
set_map('<C-b>', 'buffers')
set_map('<C-t>', 'live_grep')


telescope.load_extension('dap')
