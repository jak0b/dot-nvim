local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local set = vim.keymap.set

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

opt.rtp:prepend(lazypath)

-- set the leader key
vim.g.mapleader = ';'

require("lazy").setup({
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },

  "NvChad/nvim-colorizer.lua",
  "kylechui/nvim-surround",

  { 'RaafatTurki/hex.nvim' },

  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "akinsho/bufferline.nvim",
    version = "v3.*"
  },

  "nvim-treesitter/nvim-treesitter",
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "windwp/nvim-autopairs",

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip"
    },
  },

  -- "lukas-reineke/indent-blankline.nvim",
  "nvim-lualine/lualine.nvim",

  "Shatur/neovim-ayu",

  { "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  "terrortylor/nvim-comment",

  { "cbochs/portal.nvim",      dependencies = { "cbochs/grapple.nvim", "ThePrimeagen/harpoon" } },
  "jbyuki/venn.nvim"
})
