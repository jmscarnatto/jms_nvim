vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = false
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("hi CursorLineNr guifg=#5a5a5a")
vim.cmd("set cursorline")
vim.cmd("set cursorlineopt=number")
vim.cmd("set nuw=5")

vim.keymap.set('n', '<leader><leader>', "<leader>p", { desc = "Previous Tab" })

