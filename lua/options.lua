-- Basic options
vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.relativenumber = true
vim.keymap.set('n', '<leader>l', ':set rnu!<CR>', {})

-- Motions
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- File explorer
--vim.g.netrw_keepdir = 0
--vim.g.netrw_winsize = 30
--vim.g.netrw_banner = 0
vim.keymap.set('n', '<leader>n', ':Explore<CR>', {})
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'netrw'},
    callback = function()
        vim.cmd('nmap <buffer> a %:w<CR>:buffer #<CR>')
        vim.cmd('nmap <buffer> <BS> -')
        vim.cmd('nmap <buffer> <Del> D')
    end
})

-- Windows
vim.opt.splitbelow = true
vim.keymap.set('n', '<leader>h', '<C-w>h', {})
vim.keymap.set('n', '<leader>l', '<C-w>l', {})
vim.keymap.set('n', '<leader>j', '<C-w>j', {})
vim.keymap.set('n', '<leader>k', '<C-w>k', {})
vim.keymap.set('n', '<leader>s', '<C-w>s', {})
vim.keymap.set('n', '<leader>v', '<C-w>v', {})
vim.keymap.set('n', '<tab>', ':bnext<CR>', {})
vim.keymap.set('n', '<S-tab>', ':bprev<CR>', {})
vim.keymap.set('n', '<leader>x', ':bd<CR>', {})

-- Terminal
vim.keymap.set('n', '<leader>t', ':split +terminal<CR>', {})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:q!<CR>', {})
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        vim.cmd(':set nonu')
        vim.cmd(':set nornu')
        vim.cmd(':startinsert')
    end
})
