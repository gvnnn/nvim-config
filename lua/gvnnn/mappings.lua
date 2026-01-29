local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>pv', vim.cmd.Ex)

-- Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set({'n', 'v'}, 'gy', '"+y', { desc = 'copy to system clipboard' })
vim.keymap.set({'n', 'v'}, 'gp', '"+p', { desc = 'paste from system clipboard' })

vim.keymap.set('n', '<leader>g', vim.cmd.Git, { desc = 'open vim-fugitive' })

vim.keymap.set('n', '<leader>d', ':bp|bd #<CR>', { desc = 'close buffer' })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
