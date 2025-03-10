return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require("mini.comment").setup {}
    require("mini.move").setup {}
    require("mini.pairs").setup {}
  end,
}
