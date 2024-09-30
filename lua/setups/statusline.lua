require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    disabled_filetypes = {},
    always_divide_middle = false,
    globalstatus = true,
    section_separators = '',
    component_separators = ''
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return str:sub(1,1) end }},
    lualine_b = { 'location', 'branch', 'diff' },
    lualine_c = { { 'filename', file_status = true, path = 3 } },
    lualine_x = { "%S", 'diagnostics' },
    lualine_y = { 'filesize' },
    lualine_z = { 'filetype' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', file_status = true, path = 1 } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
