local servers = {
  pyright = {},
  rust_analyzer = {},
  gopls = {},
  bashls = {},
  terraformls = {},
  lua_ls = {},
  clangd = {},
  tinymist = {},
  eslint = {},
}

require("mason").setup()

require("mason-lspconfig").setup({
    automatic_enable = false,
    ensure_installed = vim.tbl_keys(servers or {})
})

for server, lsp_settings in pairs(servers) do
  vim.lsp.config(server, lsp_settings)
  vim.lsp.enable(server)
end

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    -- Unset 'formatexpr'
    vim.bo[args.buf].formatexpr = nil
    -- Unset 'omnifunc'
    vim.bo[args.buf].omnifunc = nil
    -- Unmap K
    vim.keymap.del('n', 'K', { buffer = args.buf })

    vim.api.nvim_buf_set_option(args.buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_buf_set_keymap(args.buf, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end,
})
