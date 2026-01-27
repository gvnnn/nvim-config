vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.completeopt = 'menuone,noselect,popup'

vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = '↪ '

vim.opt.ignorecase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}

vim.opt.inccommand = 'split'

vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 5

vim.opt.winborder = 'rounded'
