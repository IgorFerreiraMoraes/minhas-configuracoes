local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Space>pf', builtin.find_files, {})
vim.keymap.set('n', '<Space>pb', builtin.buffers, {})
vim.keymap.set('n', '<Space>pp', builtin.git_files, {})

