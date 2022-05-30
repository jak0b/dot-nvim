vim.cmd [[
augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
augroup end
]]

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Auto RBGA colorizer
  use { 'norcalli/nvim-colorizer.lua' }

  use { 'ur4ltz/surround.nvim' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  use { 'nvim-telescope/telescope-dap.nvim' }

  -- Neovim tree sitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'L3MON4D3/LuaSnip',
      },
    },
  } -- Autocompletion plugin

  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'rcarriga/nvim-dap-ui'
  use 'mfussenegger/nvim-dap-python'

  -- Venn ASCII diagrams
  use 'jbyuki/venn.nvim'

  -- bufferline
  use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons' }

  -- status line
  use {
    'hoob3rt/lualine.nvim',
    requires = { {
      'kdheepak/tabline.nvim',
    } },
  }

  use 'lukas-reineke/indent-blankline.nvim'

  -- Ease buffer cleanup
  use 'ojroques/nvim-bufdel'

  -- content tree
  use 'kyazdani42/nvim-tree.lua'

  use 'taybart/b64.nvim'

  use 'EdenEast/nightfox.nvim'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }

  use 'terrortylor/nvim-comment'

end)
