-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('i', 'jj', '<ESC>')

-- Buffers
vim.keymap.set('n', '<leader>bc', '<cmd>BufferClose<CR>')

-- Windows
vim.keymap.set('n', '<leader>wh', '<cmd>split<CR>')
vim.keymap.set('n', '<leader>wv', '<cmd>vsplit<CR>')
vim.keymap.set('n', '<leader>wq', '<cmd>q<CR>')
vim.keymap.set('n', '<leader>wtn', '<cmd>tabnew<CR>')
vim.keymap.set('n', '<leader>wtc', '<cmd>tabclose<CR>')
