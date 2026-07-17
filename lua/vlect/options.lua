-- Editor options. Carried over from the old set.lua, with a few practices
-- adopted from neobean/LazyVim (undo in stdpath, updatetime, splits, search).

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Keep long-lived undo instead of swap/backup files. Undo now lives in
-- nvim's state dir rather than ~/.vim/undodir.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- 50 made LSP/diagnostic events too chatty; 200 is what neobean settled on
vim.opt.updatetime = 200
vim.opt.timeoutlen = 500

vim.opt.colorcolumn = "80"

vim.opt.splitright = true
vim.opt.splitbelow = true
