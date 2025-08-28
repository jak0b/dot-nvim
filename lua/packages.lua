local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }},
  "projekt0n/github-nvim-theme",
  "NvChad/nvim-colorizer.lua",
  "kylechui/nvim-surround",
  {"nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }},
  "akinsho/bufferline.nvim",
  "nvim-treesitter/nvim-treesitter",
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "windwp/nvim-autopairs",
  {"hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lua", "L3MON4D3/LuaSnip" }},
  "nvim-lualine/lualine.nvim",
  { "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" }},
  "terrortylor/nvim-comment",
})
