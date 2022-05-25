local lualine = require "lualine"

local function mode()
  -- source https://github.com/nvim-lualine/lualine.nvim/blob/c12b1673107c181e32ce54f2dc4c76a2a884d7ba/lua/lualine/utils/mode.lua
  local map = {
    ["n"] = "N",
    ["no"] = "O",
    ["nov"] = "O",
    ["noV"] = "O",
    ["no\22"] = "O",
    ["niI"] = "N",
    ["niR"] = "N",
    ["niV"] = "N",
    ["nt"] = "N",
    ["v"] = "V",
    ["vs"] = "V",
    ["V"] = "L",
    ["Vs"] = "L",
    ["\22"] = "VB",
    ["\22s"] = "VB",
    ["s"] = "S",
    ["S"] = "SL",
    ["\19"] = "SB",
    ["i"] = "I",
    ["ic"] = "I",
    ["ix"] = "I",
    ["R"] = "R",
    ["Rc"] = "R",
    ["Rx"] = "R",
    ["Rv"] = "VR",
    ["Rvc"] = "VR",
    ["Rvx"] = "VR",
    ["c"] = "C",
    ["cv"] = "X",
    ["ce"] = "X",
    ["r"] = "P",
    ["rm"] = "M",
    ["r?"] = "F",
    ["!"] = "S",
    ["t"] = "T",
  }
  local mode_code = vim.api.nvim_get_mode().mode
  local mode_sign = map[mode_code]
  if mode_sign == nil then
    return mode_code
  else
    return mode_sign
  end
end

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "ayu",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = { mode, "location" },
    lualine_b = { "branch", "diff" },
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = { "diagnostics" },
    lualine_z = { "encoding", "fileformat", "filetype" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
