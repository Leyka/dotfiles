local opt = vim.opt

opt.encoding = "utf-8"
opt.number = true
opt.cursorline = true
opt.mouse = "a"
opt.mousescroll = "ver:3,hor:6"
opt.clipboard = "unnamedplus"

-- Indentation
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.termguicolors = true
opt.showmatch = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.splitright = true
opt.splitbelow = true
opt.completeopt = "menuone,noinsert,noselect"
