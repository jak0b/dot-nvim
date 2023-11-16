local g = vim.g
local cmd = vim.cmd
local set = vim.keymap.set


local function setMapLeader() 
  vim.g.mapleader = ';'
end

setMapLeader()

-- map('n', '<leader><space>', ':set hlsearch!<cr>', map_args)
-- set("n", "<leader>cd", ":cd %:p:h<cr>")

set('n', '<leader>q', ':q<CR>')

-- Telescope

-- Quick mappings
set('n', '<leader><space>', ':Telescope buffers<cr>')
set('n', '<leader>f', ':Telescope find_files<cr>')
set('n', '<leader>g', ':Telescope live_grep<cr>')
set('n', '<leader>G', ':Telescope grep_string<cr>')

-- Basic buildins
set('n', '<leader>tt', ':Telescope<cr>')
set('n', '<leader>o', ':Telescope oldfiles<cr>')
set('n', '<leader>tf', ':Telescope file_browser<cr>')
set('n', '<leader>tkm', ':Telescope keymaps<cr>')
set('n', '<leader>tht', ':Telescope help_tags<cr>')
set('n', '<leader>tr', ':Telescope registers<cr>')

set('n', '<leader>tlr', ':Telescope lsp_references<cr>')
set('n', '<leader>tld', ':Telescope lsp_definition<cr>')
set('n', '<leader>tli', ':Telescope lsp_implementations<cr>')
set('n', '<leader>tlD', ':Telescope lsp_type_definitions<cr>')

set('n', '<leader>tgc', ':Telescope git_commits<cr>')
set('n', '<leader>tgC', ':Telescope git_bcommits<cr>')
set('n', '<leader>tgb', ':Telescope git_branches<cr>')
set('n', '<leader>tgs', ':Telescope git_status<cr>')
set('n', '<leader>tgS', ':Telescope git_stash<cr>')

set('n', '<leader>tgS', ':Telescope git_stash<cr>')

-- tree
set('', '<C-n>', ':NvimTreeToggle<cr>')
set('', '<leader>r', ':NvimTreeRefresh<cr>')
set('', '<leader>c', ':NvimTreeFindFile<cr>')

-- dap
-- set('n', '<leader>dc', ':lua require\'dap\'.continue()<cr>')
-- set('n', '<leader>do', ':lua require\'dap\'.step_over()<cr>')
-- set('n', '<leader>di', ':lua require\'dap\'.step_into()<cr>')
-- set('n', '<leader>do', ':lua require\'dap\'.step_out()<cr>')
-- set('n', '<leader>db', ':lua require\'dap\'.toggle_breakpoint()<cr>')
-- set('n', '<leader>dB', ':lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<cr>')
-- set('n', '<leader>dlp', ':lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<cr>')
-- set('n', '<leader>dr', ':lua require\'dap\'.repl.toggle()<cr>')
-- set('n', '<leader>da', ':Telescope dap configurations<cr>')

set('n', '<leader>C', ':ColorizerToggle<cr>')

set('n', '<leader>li', ':LspInfo<cr>')
set('n', '<leader>ll', ':LspLog<cr>')
set('n', '<leader>lr', ':LspRestart<cr>')
set('n', '<leader>ls', ':LspStart<cr>')
set('n', '<leader>lp', ':LspStop<cr>')

set('n', '<leader>dl', ':lua require\'dap\'.run_last()<cr>')
set('n', '<leader>du', ':lua require\'dapui\'.toggle()<cr>') -- toggle DAP nvim UI

--- Delete buffer
set('', '<leader>x', ':BufDel<cr>')
set('', '<leader>X', ':BufDel!<cr>')

-- LSP saga
set('n', 'gh', ':lua require\'lspsaga.provider\'.lsp_finder()<cr>') -- toggle DAP nvim UI

-- Terminal exti
set('t', '<Esc>', '<C-\\><C-n>')

set('n', '<leader>b', ':bnext<cr>')
set('n', '<leader>B', ':bprevious<cr>')

set('n', '<C-J>', '<C-W><C-J>')
set('n', '<C-K>', '<C-W><C-K>')
set('n', '<C-L>', '<C-W><C-L>')
set('n', '<C-H>', '<C-W><C-H>')

-- Rust
cmd [[
autocmd FileType rust nnoremap <buffer><leader>au :wall<cr> :!cargo update<cr>

autocmd FileType rust nnoremap <buffer><leader>ab :wall<cr> :!cargo build<cr>
autocmd FileType rust nnoremap <buffer><leader>aB :wall<cr> :!cargo build --release<cr>

autocmd FileType rust nnoremap <buffer><leader>ar :wall<cr> :!cargo run<cr>
autocmd FileType rust nnoremap <buffer><leader>aR :wall<cr> :!cargo run --release<cr>

autocmd FileType rust nnoremap <buffer><leader>at :wall<cr> :!cargo test<cr>
autocmd FileType rust nnoremap <buffer><leader>aT :wall<cr> :!cargo test --release<cr>

autocmd FileType rust nnoremap <buffer><leader>ac :wall<cr> :!cargo clean<cr>
autocmd FileType rust nnoremap <buffer><leader>aC :wall<cr> :!cargo test --release<cr>
]]

-- base64
set('v', '<leader>be :<c-u>', ':lua require("b64").encode()<cr>', { noremap = true })
set('v', '<leader>bd :<c-u>', ':lua require("b64").decode()<cr>', { noremap = true })
