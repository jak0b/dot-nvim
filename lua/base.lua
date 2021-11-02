local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

opt.number = true -- show line number
opt.showmatch = true -- highlight matching parenthesis
opt.foldmethod = "marker" -- enable folding (default 'foldmarker')
-- opt.colorcolumn = '110'        -- line length marker at 120 columns
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- horizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern

---
-- opt.virtualedit = "all" -- enable virtual edit for moving the cursor freely across the sreeen

-- allow to move the current window
-- to a different buffer without saving
opt.hidden = true

-- display the current window's title
opt.title = true

-- disalbe swap file
opt.swapfile = false

-- enable mouse support
opt.mouse = "a"

--Set highlight on search
opt.hlsearch = true

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

-- Enable the highlight over the current cursor line
-- Remover the highlight from the line and embolden the line number
opt.cursorline = true
cmd [[
au BufEnter * highlight clear CursorLine
au BufEnter * highlight CursorLineNr guifg=bold
]]

-- Tabs, indent
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 2 -- shift 4 spaces when tab
opt.tabstop = 2 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines

-- colors settings
opt.background = "dark"
opt.termguicolors = true

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Spell checking
opt.spelllang = "en_gb,de,pl"
-- set the theme
-- cmd [[colorscheme blue-moon]]
cmd [[colorscheme ayu-dark]]

-- Disable number in the termianl window
cmd [[
au TermOpen * setlocal nonumber
]]


opt.showbreak = "↪>\\"


opt.listchars="tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
