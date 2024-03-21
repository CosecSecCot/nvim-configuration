vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.termguicolors = true
vim.opt.updatetime = 50

vim.cmd [[autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s]]
vim.cmd [[set nohlsearch]]
vim.cmd [[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']]
vim.g.netrw_banner = false

vim.opt.laststatus = 3

-- vim.opt.listchars = {
-- 	eol = "↲",
-- }
-- vim.opt.list = true
