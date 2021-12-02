local g = vim.g
local cmd = vim.cmd

local dmap = function(mode, lhs, rhs)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

g.mapleader = ";"

-- map('n', '<leader><space>', ':set hlsearch!<CR>', map_args)
dmap("n", "<leader>cd", ":cd %:p:h<CR>")

dmap("n", "<leader>q", ":quitall<CR>")

-- Telescope


-- Quick mappings
dmap("n", "<leader><space>", ":Telescope buffers<CR>")
dmap("n", "<leader>f", ":Telescope find_files<CR>")
dmap("n", "<leader>g", ":Telescope live_grep<CR>")
dmap("n", "<leader>G", ":Telescope grep_string<CR>")

-- Basic buildins
dmap("n", "<leader>tt", ":Telescope<CR>")
dmap("n", "<leader>to", ":Telescope oldfiles<CR>")
dmap("n", "<leader>tf", ":Telescope file_browser<CR>")
dmap("n", "<leader>tkm", ":Telescope keymaps<CR>")
dmap("n", "<leader>tht", ":Telescope help_tags<CR>")
dmap("n", "<leader>tr", ":Telescope registers<CR>")

dmap("n", "<leader>tlr", ":Telescope lsp_references<CR>")
dmap("n", "<leader>tld", ":Telescope lsp_definition<CR>")
dmap("n", "<leader>tli", ":Telescope lsp_implementations<CR>")
dmap("n", "<leader>tlD", ":Telescope lsp_type_definitions<CR>")

dmap("n", "<leader>tgc", ":Telescope git_commits<CR>")
dmap("n", "<leader>tgC", ":Telescope git_bcommits<CR>")
dmap("n", "<leader>tgb", ":Telescope git_branches<CR>")
dmap("n", "<leader>tgs", ":Telescope git_status<CR>")
dmap("n", "<leader>tgS", ":Telescope git_stash<CR>")

dmap("n", "<leader>tgS", ":Telescope git_stash<CR>")

-- tree
dmap("", "<C-n>", ":NvimTreeToggle<CR>")
dmap("", "<leader>r", ":NvimTreeRefresh<CR>")
dmap("", "<leader>n", ":NvimTreeFindFile<CR>")

-- dap
dmap("n", "<leader>dc", ":lua require'dap'.continue()<CR>")
dmap("n", "<leader>do", ":lua require'dap'.step_over()<CR>")
dmap("n", "<leader>di", ":lua require'dap'.step_into()<CR>")
dmap("n", "<leader>do", ":lua require'dap'.step_out()<CR>")
dmap("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>")
dmap("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
dmap("n", "<leader>dlp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
dmap("n", "<leader>dr", ":lua require'dap'.repl.toggle()<CR>")
dmap("n", "<leader>da", ":Telescope dap configurations<CR>")

dmap("n", "<leader>dl", ":lua require'dap'.run_last()<CR>")
dmap("n", "<leader>du", ":lua require'dapui'.toggle()<CR>") -- toggle DAP nvim UI

--- Delete buffer
dmap("", "<leader>x", ":BufDel<CR>")
dmap("", "<leader>X", ":BufDel!<CR>")

-- LSP saga
dmap("n", "gh", ":lua require'lspsaga.provider'.lsp_finder()<CR>") -- toggle DAP nvim UI

-- Terminal exti
dmap("t", "<Esc>", "<C-\\><C-n>")


dmap("n", "<leader>b", ":bnext<CR>")
dmap("n", "<leader>B", ":bprevious<CR>")

dmap("n", "<C-J>", "<C-W><C-J>")
dmap("n", "<C-K>", "<C-W><C-K>")
dmap("n", "<C-L>", "<C-W><C-L>")
dmap("n", "<C-H>", "<C-W><C-H>")


-- Rust
cmd [[
autocmd FileType rust nnoremap <buffer><leader>au :wall<CR> :!cargo update<CR>

autocmd FileType rust nnoremap <buffer><leader>ab :wall<CR> :!cargo build<CR>
autocmd FileType rust nnoremap <buffer><leader>aB :wall<CR> :!cargo build --release<CR>

autocmd FileType rust nnoremap <buffer><leader>ar :wall<CR> :!cargo run<CR>
autocmd FileType rust nnoremap <buffer><leader>aR :wall<CR> :!cargo run --release<CR>

autocmd FileType rust nnoremap <buffer><leader>at :wall<CR> :!cargo test<CR>
autocmd FileType rust nnoremap <buffer><leader>aT :wall<CR> :!cargo test --release<CR>

autocmd FileType rust nnoremap <buffer><leader>ac :wall<CR> :!cargo clean<CR>
autocmd FileType rust nnoremap <buffer><leader>aC :wall<CR> :!cargo test --release<CR>
]]
