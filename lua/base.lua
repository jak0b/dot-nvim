local opt = vim.opt
opt.showmatch = true -- highlight matching parenthesis

vim.wo.number = true
vim.wo.relativenumber = true

opt.foldmethod = 'marker' -- enable folding (default 'foldmarker')
vim.opt.colorcolumn = '120' -- line length marker at 120 columns

opt.formatoptions = "jcroqlt"
opt.textwidth = 100
opt.wrapmargin = 0
opt.showcmdloc = "statusline"

opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- horizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern

---
-- vim.opt.virtualedit = "all" -- enable virtual edit for moving the cursor freely across the sreeen

-- allow to move the current window
-- to a different buffer without saving
opt.hidden = true

-- display the current window's title
opt.title = true

-- enable swap file
opt.swapfile = true

-- enable mouse support
opt.mouse = 'a'

--Set highlight on search
opt.hlsearch = true

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

-- Enable the highlight over the current cursor line
-- Remover the highlight from the line and embolden the line number
opt.cursorline = true

vim.cmd [[
au BufEnter * highlight clear CursorLine
]]

-- Tabs, indent
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 2 -- shift 4 spaces when tab
opt.tabstop = 2 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines

-- colors settings
opt.background = 'dark'
opt.termguicolors = true

require('github-theme').setup({ options = {
  transparent = true,
  terminal_colors = true,
}})

function apply_colorscheme()
 vim.cmd.colorscheme(
   string.format("github_%s_high_contrast",
   require("colorscheme")
 )) 
end

apply_colorscheme()

-- don't auto commenting new lines
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Spell checking
vim.opt.spelllang = 'en_gb,de,pl'

-- Disable number in the termianl window
vim.cmd [[
au TermOpen * setlocal nonumber
]]

vim.opt.showbreak = '↪>\\'

vim.opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
