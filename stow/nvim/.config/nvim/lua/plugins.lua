vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/Mofiqul/dracula.nvim",
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
  }
})
require("gitsigns")
require('nvim-treesitter').install { 'bash', 'javascript', 'css', 'htm', 'markdown_inline', 'lua' }
