-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    'n',
    '<space>wl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local function default_lsp_config()
  return {
    on_attach = on_attach,
  }
end

local servers = {
  -- Python
  ['pyright'] = default_lsp_config,

  -- Rust
  ['rust_analyzer'] = default_lsp_config,

  -- Golang
  ['gopls'] = default_lsp_config,

  -- LaTeX
  ['texlab'] = default_lsp_config,

  -- C/C++
  ['ccls'] = default_lsp_config,

  -- Bash
  ['bashls'] = default_lsp_config,

  -- Terraform
  ['terraformls'] = default_lsp_config,

  -- vala
  ['vala_ls'] = default_lsp_config,

  -- lua
  -- ['lua_ls'] = function()
  --   local sumneko_binary_path = vim.fn.exepath 'lua-language-server'
  --   local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')
  --
  --   local runtime_path = vim.split(package.path, ';')
  --   table.insert(runtime_path, 'lua/?.lua')
  --   table.insert(runtime_path, 'lua/?/init.lua')
  --   return {
  --     cmd = { sumneko_binary_path, '-E', sumneko_root_path .. '/main.lua' },
  --     on_attach = on_attach,
  --     settings = {
  --       Lua = {
  --         runtime = {
  --           -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
  --           version = 'LuaJIT',
  --           -- Setup your lua path
  --           path = runtime_path,
  --         },
  --         diagnostics = {
  --           -- Get the language server to recognize the `vim` global
  --           globals = { 'vim' },
  --         },
  --         workspace = {
  --           -- Make the server aware of Neovim runtime files
  --           library = vim.api.nvim_get_runtime_file('', true),
  --         },
  --         -- Do not send telemetry data containing a randomized but unique identifier
  --         telemetry = {
  --           enable = false,
  --         },
  --       },
  --     },
  --   }
  -- end,
}

for server, config_func in pairs(servers) do
  local server_config = config_func()
  require('lspconfig')[server].setup(server_config)
end
