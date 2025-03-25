return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    require("mini.icons").setup({})
    require("mini.comment").setup({})
    require("mini.move").setup({})
    require("mini.statusline").setup({})
    require("mini.pairs").setup({})
    -- require("mini.tabline").setup({
    --   format = function(buf_id, label)
    --   local suffix = vim.bo[buf_id].modified and "[+] " or ""
    --   return MiniTabline.default_format(buf_id, label) .. suffix
    --  end,
    -- })
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
      highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
    require("mini.files").setup({
      mappings = {
        synchronize = "s",
      },
      options = {
        -- module specific trash folder - might need some cleaning?
        permanent_delete = false,
        use_as_default_explorer = true,
      },
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
    })
  end,
}
