-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("i", "jj", "<ESC>")

-- Buffers
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Buffer Delete" })
vim.keymap.set("n", "<leader>bj", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bk", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bl", "<cmd>blast<CR>", { desc = "Last Buffer" })

-- Windows
vim.keymap.set("n", "<leader>wh", "<cmd>split<CR>", { desc = "Horizinatal Split" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>wq", "<cmd>q<CR>", { desc = "Quit" })

vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({
    lsp_format = "fallback",
  })
end, { desc = "Format current file" })
