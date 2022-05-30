vim.opt.number = true -- show line number
vim.opt.showmatch = true -- highlight matching parenthesis
vim.opt.foldmethod = 'marker' -- enable folding (default 'foldmarker')
-- vim.opt.colorcolumn = '110'        -- line length marker at 120 columns
vim.opt.splitright = true -- vertical split to the right
vim.opt.splitbelow = true -- horizontal split to the bottom
vim.opt.ignorecase = true -- ignore case letters when search
vim.opt.smartcase = true -- ignore lowercase for the whole pattern

---
-- vim.opt.virtualedit = "all" -- enable virtual edit for moving the cursor freely across the sreeen

-- allow to move the current window
-- to a different buffer without saving
vim.opt.hidden = true

-- display the current window's title
vim.opt.title = true

-- disalbe swap file
vim.opt.swapfile = false

-- enable mouse support
vim.opt.mouse = 'a'

--Set highlight on search
vim.opt.hlsearch = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- Enable the highlight over the current cursor line
-- Remover the highlight from the line and embolden the line number
vim.opt.cursorline = true

vim.cmd [[
au BufEnter * highlight clear CursorLine
]]

-- Tabs, indent
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 2 -- shift 4 spaces when tab
vim.opt.tabstop = 2 -- 1 tab == 4 spaces
vim.opt.smartindent = true -- autoindent new lines

-- colors settings
-- opt.background = 'dark'
-- opt.termguicolors = true

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
