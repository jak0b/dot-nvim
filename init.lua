-- vim: acd

local pkgs = {
  'packages',
  'base',
  'setups/telescope',
  'setups/comments',
  'setups/lsp',
  'setups/git',
  'setups/treesitter',
  'setups/tree',
  'setups/surround',
  'setups/mason',
  'setups/statusline',
  'setups/cmp',
  'setups/autopair',
  'mappings'
}

for _, pkg in ipairs(pkgs) do
  require(pkg)
end
