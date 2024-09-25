-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
require 'custom.scripts.rspec'
require 'custom.scripts.test'
require 'custom.scripts.autosave'

vim.api.nvim_set_keymap('n', '<leader>ka', ':lua testEntireSpec()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>kc', ':lua testLineInSpec()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ks', ':lua openAssociatedSpec()<CR>', { noremap = true, silent = true })

return {}
