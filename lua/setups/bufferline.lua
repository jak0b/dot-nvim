local bufferline = require "bufferline"

bufferline.setup {
  highlights = {
    fill = {
      guibg = "#0F131A",
    },
  },
  options = {
    numbers = function(opts)
      return ""
    end,
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator_icon = "▎",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    name_formatter = function(buf)
      if buf.name:match "%.md" then
        return vim.fn.fnamemodify(buf.name, ":t:r")
      end
    end,
    show_close_icon = false,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    always_show_bufferline = false,
    diagnostics = false,
    offsets = { { filetype = "NvimTree", text = "tree", highlight = "Directory" } },
  },
}
