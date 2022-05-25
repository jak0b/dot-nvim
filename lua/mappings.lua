local g = vim.g
local cmd = vim.cmd
local set = vim.keymap.set

g.mapleader = ";"

-- map('n', '<leader><space>', ':set hlsearch!<CR>', map_args)
-- set("n", "<leader>cd", ":cd %:p:h<CR>")

set("n", "<leader>q", ":quitall<CR>")

-- Telescope

-- Quick mappings
set("n", "<leader><space>", ":Telescope buffers<CR>")
set("n", "<leader>f", ":Telescope find_files<CR>")
set("n", "<leader>g", ":Telescope live_grep<CR>")
set("n", "<leader>G", ":Telescope grep_string<CR>")

-- Basic buildins
set("n", "<leader>tt", ":Telescope<CR>")
set("n", "<leader>o", ":Telescope oldfiles<CR>")
set("n", "<leader>tf", ":Telescope file_browser<CR>")
set("n", "<leader>tkm", ":Telescope keymaps<CR>")
set("n", "<leader>tht", ":Telescope help_tags<CR>")
set("n", "<leader>tr", ":Telescope registers<CR>")

set("n", "<leader>tlr", ":Telescope lsp_references<CR>")
set("n", "<leader>tld", ":Telescope lsp_definition<CR>")
set("n", "<leader>tli", ":Telescope lsp_implementations<CR>")
set("n", "<leader>tlD", ":Telescope lsp_type_definitions<CR>")

set("n", "<leader>tgc", ":Telescope git_commits<CR>")
set("n", "<leader>tgC", ":Telescope git_bcommits<CR>")
set("n", "<leader>tgb", ":Telescope git_branches<CR>")
set("n", "<leader>tgs", ":Telescope git_status<CR>")
set("n", "<leader>tgS", ":Telescope git_stash<CR>")

set("n", "<leader>tgS", ":Telescope git_stash<CR>")

-- tree
set("", "<C-n>", ":NvimTreeToggle<CR>")
set("", "<leader>r", ":NvimTreeRefresh<CR>")
set("", "<leader>c", ":NvimTreeFindFile<CR>")

-- dap
set("n", "<leader>dc", ":lua require'dap'.continue()<CR>")
set("n", "<leader>do", ":lua require'dap'.step_over()<CR>")
set("n", "<leader>di", ":lua require'dap'.step_into()<CR>")
set("n", "<leader>do", ":lua require'dap'.step_out()<CR>")
set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>")
set("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
set("n", "<leader>dlp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
set("n", "<leader>dr", ":lua require'dap'.repl.toggle()<CR>")
set("n", "<leader>da", ":Telescope dap configurations<CR>")

set("n", "<leader>dl", ":lua require'dap'.run_last()<CR>")
set("n", "<leader>du", ":lua require'dapui'.toggle()<CR>") -- toggle DAP nvim UI

--- Delete buffer
set("", "<leader>x", ":BufDel<CR>")
set("", "<leader>X", ":BufDel!<CR>")

-- LSP saga
set("n", "gh", ":lua require'lspsaga.provider'.lsp_finder()<CR>") -- toggle DAP nvim UI

-- Terminal exti
set("t", "<Esc>", "<C-\\><C-n>")

set("n", "<leader>b", ":bnext<CR>")
set("n", "<leader>B", ":bprevious<CR>")

set("n", "<C-J>", "<C-W><C-J>")
set("n", "<C-K>", "<C-W><C-K>")
set("n", "<C-L>", "<C-W><C-L>")
set("n", "<C-H>", "<C-W><C-H>")

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
