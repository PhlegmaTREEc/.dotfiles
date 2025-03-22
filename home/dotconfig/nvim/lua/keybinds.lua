-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('i', 'jj', '<ESC>')

-- Buffers
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>')
vim.keymap.set('n', '<leader>bj', '<cmd>bprevious<CR>', { desc = "Previous Buffer" })
vim.keymap.set('n', '<leader>bk', '<cmd>bnext<CR>', { desc = "Next Buffer" })
vim.keymap.set('n', '<leader>bl', '<cmd>blast<CR>', { desc = "Last Buffer" })

-- Windows
vim.keymap.set('n', '<leader>wh', '<cmd>split<CR>')
vim.keymap.set('n', '<leader>wv', '<cmd>vsplit<CR>')
vim.keymap.set('n', '<leader>wq', '<cmd>q<CR>')
vim.keymap.set('n', '<leader>wtn', '<cmd>tabnew<CR>')
vim.keymap.set('n', '<leader>wtc', '<cmd>tabclose<CR>')

-- mini.files
vim.keymap.set('n', '<leader>ff', function ()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end,
  { desc = "mini.files CF" })
vim.keymap.set('n', '<leader>fF', function ()
  require("mini.files").open(vim.uv.cwd(), true)
end,
  { desc = "mini files CWD" })
