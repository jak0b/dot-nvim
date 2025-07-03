local g = vim.g
local cmd = vim.cmd

local function setMapLeader() 
  vim.g.mapleader = vim.api.nvim_replace_termcodes(' ', false, false, true)
end

local function keymap(mode, lhs, rhs, opts)
  local default_options = { noremap = true, silent = true }
  if opts then
    default_options = vim.tbl_extend("force", default_options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, default_options)
end

setMapLeader()

keymap('n', '<leader>q', ':q<CR>')

keymap('', '<leader>/', ':noh<CR>')

-- Select the whole line without the newline character
keymap('v', 'il', '0o$h')
keymap('v', 'iln', '^o$h')

keymap('n', 'L', '$')
keymap('n', 'H', '^')
-- Emacs binding
keymap('n', '<C-a>', '^')
keymap('n', '<C-e>', '$')

keymap('v', 'H', '^')
keymap('v', 'L', '$')
-- Emacs binding
keymap('v', '<C-a>', '^')
keymap('v', '<C-e>', '$')

keymap('n', '<leader><space>', ':Telescope buffers<cr>')
keymap('n', '<leader>f', ':Telescope find_files<cr>')
keymap('n', '<leader>g', ':Telescope live_grep<cr>')
-- Look for a word that on which the cursor is current 
keymap('n', '<leader>G', ':Telescope grep_string<cr>')

keymap('n', '<leader>tt',  ':Telescope<cr>')
keymap('n', '<leader>o',   ':Telescope oldfiles<cr>')
keymap('n', '<leader>tf',  ':Telescope file_browser<cr>')
keymap('n', '<leader>tkm', ':Telescope keymaps<cr>')
keymap('n', '<leader>tht', ':Telescope help_tags<cr>')
keymap('n', '<leader>tr',  ':Telescope registers<cr>')

keymap('n', '<leader>tlr', ':Telescope lsp_references<cr>')
keymap('n', '<leader>tld', ':Telescope lsp_definition<cr>')
keymap('n', '<leader>tli', ':Telescope lsp_implementations<cr>')
keymap('n', '<leader>tlD', ':Telescope lsp_type_definitions<cr>')

keymap('n', '<leader>tgc', ':Telescope git_commits<cr>')
keymap('n', '<leader>tgC', ':Telescope git_bcommits<cr>')
keymap('n', '<leader>tgb', ':Telescope git_branches<cr>')
keymap('n', '<leader>tgs', ':Telescope git_status<cr>')
keymap('n', '<leader>tgS', ':Telescope git_stash<cr>')

keymap('n', '<leader>tgS', ':Telescope git_stash<cr>')

-- tree
keymap('', '<C-n>', ':NvimTreeToggle<cr>')
keymap('', '<leader>r', ':NvimTreeRefresh<cr>')
keymap('', '<leader>c', ':NvimTreeFindFile<cr>')


keymap('n', '<leader>C', ':ColorizerToggle<cr>')

keymap('n', '<leader>li', ':LspInfo<cr>')
keymap('n', '<leader>ll', ':LspLog<cr>')
keymap('n', '<leader>lr', ':LspRestart<cr>')
keymap('n', '<leader>ls', ':LspStart<cr>')
keymap('n', '<leader>lp', ':LspStop<cr>')

keymap('n', '<leader>dl', ':lua require\'dap\'.run_last()<cr>')
keymap('n', '<leader>du', ':lua require\'dapui\'.toggle()<cr>')


-- Terminal exti
keymap('t', '<Esc>', '<C-\\><C-n>')
