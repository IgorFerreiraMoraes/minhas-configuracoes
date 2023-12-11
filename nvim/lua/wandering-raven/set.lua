vim.opt.bh = "delete"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.shiftwidth = 4
vim.opt.shiftround = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.wrap = true

vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

vim.opt.matchpairs = "(:),{:},[:],<:>"

vim.opt.shell = vim.fn.executable('pwsh') and 'pwsh' or 'powershell'

vim.opt.fileformat = "dos"
vim.opt.endofline = true
vim.opt.endoffile = true
vim.opt.fixendofline = true
