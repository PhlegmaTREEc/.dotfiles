return {
  "echasnovski/mini.files",
  version = "*",
  opts = {
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
  },
  keys = {
    vim.keymap.set("n", "<leader>ff", function()
      require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
    end, { desc = "mini.files CF" }),
    vim.keymap.set("n", "<leader>fF", function()
      require("mini.files").open(vim.uv.cwd(), true)
    end, { desc = "mini files CWD" }),
  },
}
