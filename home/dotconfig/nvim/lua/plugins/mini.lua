return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require("mini.comment").setup {}
    require("mini.move").setup {}
    require("mini.pairs").setup {}
    local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
  end,
}
