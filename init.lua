-- vim: acd

local pkgs = { 'packers', 'base', 'setups', 'mappings' }

for _, pkg in ipairs(pkgs) do
  require(pkg)
end
