local cmd = vim.cmd
local packer = require "packer"

cmd [[
augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
augroup end
]]

cmd [[packadd packer.nvim]]

packer.startup(function()
  -- Auto RBGA colorizer
  use { "norcalli/nvim-colorizer.lua" }

  use { "ur4ltz/surround.nvim" }

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-dap.nvim" },
    },
  }

  -- Neovim tree sitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
  use "hrsh7th/nvim-cmp" -- Autocompletion plugin
  use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
  use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
  use "L3MON4D3/LuaSnip" -- Snippets plugin

  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use "mfussenegger/nvim-dap-python"

  use "kyazdani42/blue-moon"

  -- Venn ASCII diagrams
  use "jbyuki/venn.nvim"

  -- bufferline
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}

  -- status line
  use "hoob3rt/lualine.nvim"

  -- Ease buffer cleanup
  use "ojroques/nvim-bufdel"

  -- content tree
  use "kyazdani42/nvim-tree.lua"

  -- Ayu theme
  use "Shatur/neovim-ayu"

  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  use "terrortylor/nvim-comment"
end)
