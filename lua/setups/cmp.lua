require('cmp').setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = require('cmp').mapping(require('cmp').mapping.select_next_item()),
    ['<C-p>'] = require('cmp').mapping(require('cmp').mapping.select_prev_item()),
    ['<C-b>'] = require('cmp').mapping.scroll_docs(-4),
    ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
    ['<C-Space>'] = require('cmp').mapping.complete(),
    ['<C-e>'] = require('cmp').mapping.close(),
    ['<CR>'] = require('cmp').mapping.confirm { select = true },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
  },
}
