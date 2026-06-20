vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.autoindent  = true

vim.opt.undofile    = true
vim.opt.undodir     = vim.fn.stdpath("data") .. "/undo"
vim.opt.undolevels  = 10000

require("config.lazy")
