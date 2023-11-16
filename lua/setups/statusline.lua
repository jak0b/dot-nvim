require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    disabled_filetypes = {},
    always_divide_middle = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode', 'location' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { { 'filename', file_status = true, path = 1 } },
    lualine_x = {},
    lualine_y = { 'diagnostics' },
    lualine_z = { 'encoding', 'filetype' },
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
