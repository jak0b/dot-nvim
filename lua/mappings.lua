local g = vim.g

dmap = function (mode, lhs, rhs)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

g.mapleader = ';'

-- map('n', '<leader><space>', ':set hlsearch!<CR>', map_args)
dmap('n', '<leader>cd', ':cd %:p:h<CR>')

dmap('n', '<leader>q', ':quitall<CR>')

dmap('n', '<leader>k', ':Telescope lsp_definition<CR>')
dmap('n', '<leader><space>', ':Telescope buffers<CR>')
dmap('n', '<leader>f', ':Telescope find_files previewer=false<CR>')
dmap('n', '<leader>c', ':Telescope current_buffer_fuzzy_find<CR>')
dmap('n', '<leader>h', ':Telescope help_tags<CR>')
dmap('n', '<leader>t', ':Telescope tags<CR>')
dmap('n', '<leader>d', ':Telescope grep_string<CR>')
dmap('n', '<leader>l', ':Telescope live_grep<CR>')
dmap('n', '<leader>o', ':Telescope tags only_current_buffer=true<CR>')
dmap('n', '<leader>?', ':Telescope oldfiles<CR>')

-- tree
dmap('','<C-n>', ':NvimTreeToggle<CR>')
dmap('','<leader>r', ':NvimTreeRefresh<CR>')
dmap('','<leader>n', ':NvimTreeFindFile<CR>')


-- dap
dmap('n', "<leader>dc",  ":lua require'dap'.continue()<CR>")
dmap('n', "<leader>do",  ":lua require'dap'.step_over()<CR>")
dmap('n', "<leader>di",  ":lua require'dap'.step_into()<CR>")
dmap('n', "<leader>do",  ":lua require'dap'.step_out()<CR>")
dmap('n', "<leader>db",  ":lua require'dap'.toggle_breakpoint()<CR>")
dmap('n', "<leader>dB",  ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
dmap('n', "<leader>dlp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
dmap('n', "<leader>dr",  ":lua require'dap'.repl.open()<CR>")

dmap('n', "<leader>dl",  ":lua require'dap'.run_last()<CR>")
dmap('n', "<leader>du",  ":lua require'dapui'.toggle()<CR>") -- toggle DAP nvim UI


-- LSP saga
dmap('n', "gh",  ":lua require'lspsaga.provider'.lsp_finder()<CR>") -- toggle DAP nvim UI


