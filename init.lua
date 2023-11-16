-- vim: acd

local pkgs = { 'packages', 'base', 'setups', 'mappings' }

for _, pkg in ipairs(pkgs) do
  require(pkg)
end
